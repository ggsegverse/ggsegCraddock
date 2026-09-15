# Shared helpers for the Craddock and ADHD-200 atlas builds.

# FreeSurfer's aparc+aseg, resampled onto the parcellation grid, gives every
# parcel a tissue composition. Cached because the resample is the slow part.
parcel_composition <- function(
  volume_file,
  label_fmt = "Parcel_%03d",
  cache_file = NULL
) {
  aparc_src <- file.path(
    Sys.getenv("FREESURFER_HOME"),
    "subjects",
    "cvs_avg35_inMNI152",
    "mri",
    "aparc+aseg.mgz"
  )
  if (is.null(cache_file)) {
    cache_file <- tempfile(fileext = ".nii.gz")
  }
  if (!file.exists(cache_file)) {
    system2(
      "mri_vol2vol",
      c(
        "--mov",
        shQuote(aparc_src),
        "--targ",
        shQuote(volume_file),
        "--regheader",
        "--interp",
        "nearest",
        "--o",
        shQuote(cache_file)
      )
    )
  }

  parcellation <- as.array(RNifti::readNifti(volume_file))
  aseg <- as.array(RNifti::readNifti(cache_file))
  label_ids <- sort(unique(as.integer(parcellation[parcellation > 0])))

  subcortical_grey <- c(
    4L,
    10L,
    11L,
    12L,
    13L,
    14L,
    15L,
    17L,
    18L,
    26L,
    28L,
    43L,
    49L,
    50L,
    51L,
    52L,
    53L,
    54L,
    58L,
    60L
  )
  cerebellum <- c(7L, 8L, 46L, 47L)
  brainstem <- 16L

  fractions <- vapply(
    label_ids,
    function(id) {
      hit <- aseg[parcellation == id]
      c(
        cortex = mean(hit >= 1000 | hit %in% c(3L, 42L)),
        subcortex = mean(hit %in% subcortical_grey),
        cerebellum = mean(hit %in% cerebellum),
        brainstem = mean(hit == brainstem)
      )
    },
    numeric(4)
  )

  data.frame(
    idx = label_ids,
    label = sprintf(label_fmt, label_ids),
    t(fractions),
    stringsAsFactors = FALSE
  )
}

# The Craddock-family lookup tables carry no anatomical `type`, so
# create_wholebrain_from_volume() falls back to counting surface vertices, and
# a parcel that projects to fewer than `min_vertices` vertices lands in the
# subcortical atlas as a free-floating blob over the cortex. Settle those
# cases on anatomy instead, from the aparc+aseg composition.
#
# The test compares grey matter against grey matter, ignoring the white
# matter and the voxels aparc+aseg does not label at all. That last part is
# what the earlier absolute threshold got wrong: the ADHD-200 parcellations
# were clustered on EPI data and reach past the edge of FreeSurfer's brain,
# so a superficial parcel can be two-thirds unlabelled and still only
# one-quarter cortical ribbon by volume - frontal pole and superior parietal
# parcels sat at 0.20-0.24 and fell through a 0.25 cut. Measured against the
# labelled grey they touch, the same parcels are 60-100% cortical.
#
# Cerebellum is separated the same way, and first, because a parcel straddling
# the tentorium reads as part cortical.
classify_parcels <- function(
  volume_file,
  label_fmt = "Parcel_%03d",
  cache_file = NULL,
  min_cortical = 0.6,
  min_cerebellar = 0.5
) {
  comp <- parcel_composition(volume_file, label_fmt, cache_file)
  grey <- comp$cortex + comp$subcortex + comp$cerebellum + comp$brainstem

  share <- function(x) ifelse(grey > 0, x / grey, 0)
  is_cerebellar <- share(comp$cerebellum) >= min_cerebellar &
    comp$cerebellum >= comp$cortex &
    comp$cerebellum >= comp$subcortex
  # A stray ribbon voxel or two should not make a white-matter parcel
  # cortical, hence the floor on the raw fraction as well as the share.
  is_cortical <- !is_cerebellar &
    share(comp$cortex) >= min_cortical &
    comp$cortex >= 0.05

  list(
    cortical = comp$label[is_cortical],
    cerebellar = comp$label[is_cerebellar],
    composition = comp
  )
}

# The cerebellar pipeline draws on the SUIT flatmap, so the parcels have to
# be carried into SUIT space first; create_wholebrain_from_volume() leaves
# them in the input space, which is why the cerebellar atlas is built here
# rather than through its `cerebellar_labels` argument.
#
# The Craddock parcels are numbered, not named, so the side each one sits on
# has to come from its centroid. create_cerebellar_from_volume() reads the
# side off a `Left_`/`Right_`/`Vermis_` prefix on the LUT label and strips it
# again, so the finished labels come out as `left_Parcel_009`, matching how
# the cortical atlas prefixes its own.
cerebellar_lut <- function(volume_file, cerebellar_labels, label_fmt) {
  vol <- RNifti::readNifti(volume_file)
  arr <- as.array(vol)
  ids <- sort(unique(as.integer(arr[arr > 0])))
  keep <- ids[sprintf(label_fmt, ids) %in% cerebellar_labels]

  # The vermis is the midline strip; 5 mm either side of it covers the
  # parcels that straddle the midline without swallowing the hemispheres.
  side <- vapply(
    keep,
    function(id) {
      voxels <- which(arr == id, arr.ind = TRUE)
      x <- mean(RNifti::voxelToWorld(voxels, vol)[, 1])
      if (x < -5) {
        "Left"
      } else if (x > 5) {
        "Right"
      } else {
        "Vermis"
      }
    },
    character(1)
  )

  data.frame(
    idx = keep,
    label = paste0(side, "_", sprintf(label_fmt, keep)),
    stringsAsFactors = FALSE
  )
}

build_cerebellar <- function(
  volume_file,
  cerebellar_labels,
  label_fmt,
  atlas_name,
  output_dir
) {
  if (!length(cerebellar_labels)) {
    return(NULL)
  }
  lut <- cerebellar_lut(volume_file, cerebellar_labels, label_fmt)

  vol <- RNifti::readNifti(volume_file)
  arr <- as.array(vol)
  out <- array(0L, dim = dim(arr))
  for (id in lut$idx) {
    out[arr == id] <- id
  }
  mni <- RNifti::asNifti(out, reference = vol)
  if (RNifti::orientation(mni) != "RAS") {
    RNifti::orientation(mni) <- "RAS"
  }
  mni_file <- tempfile(fileext = ".nii.gz")
  RNifti::writeNifti(mni, mni_file)

  suit_file <- tempfile(fileext = ".nii.gz")
  ggseg.extra::transform_mni_to_suit(
    input_volume = mni_file,
    deformation_field = ggseg.extra::suit_deformation_field(
      template = "MNI152NLin6AsymC"
    ),
    output_file = suit_file,
    interpolation = "nearest"
  )
  suit_vol <- RNifti::readNifti(suit_file, internal = FALSE)
  suit_arr <- as.array(suit_vol)
  storage.mode(suit_arr) <- "integer"
  RNifti::writeNifti(RNifti::asNifti(suit_arr, reference = suit_vol), suit_file)

  ggseg.extra::create_cerebellar_from_volume(
    input_volume = suit_file,
    input_lut = lut,
    atlas_name = atlas_name,
    output_dir = output_dir,
    skip_existing = FALSE,
    cleanup = FALSE,
    verbose = TRUE
  )
}

# The generated Craddock lookup tables carry 0 0 0 for every parcel, so every
# atlas would render solid black. Give each atlas evenly spaced, shuffled hues
# instead, so neighbouring parcels are distinguishable.
distinct_palette <- function(atlas, seed) {
  if (is.null(atlas)) {
    return(NULL)
  }
  labels <- ggseg.formats::atlas_labels(atlas)
  hues <- seq(15, 375, length.out = length(labels) + 1)[seq_along(labels)]
  withr::with_seed(
    seed,
    ggseg.formats::set_atlas_palette(
      atlas,
      stats::setNames(sample(grDevices::hcl(h = hues, c = 90, l = 65)), labels)
    )
  )
}

# Give the subcortical meshes the polish the pipeline no longer applies
# automatically. The grey `cortex_` silhouette and the structures drawn on it
# want opposite treatment, so they are handled in separate passes.
#
# The structures are small and solid, and rounding off the voxel staircase is
# what makes them read as anatomy rather than as pixel art, so they are
# simplified hard and closed.
#
# The silhouette's whole value is its sulcal and gyral outline, and a
# morphological close is exactly the wrong tool for it: it fills every sulcus,
# fissure and ventricle narrower than the smoothing distance, and heavy
# simplification straightens whatever survives, which is how the context came
# out as a smooth blob. It keeps most of its vertices instead, and is rounded
# with Chaikin corner-cutting, which moves vertices rather than dilating the
# shape and so leaves the openings alone. `keep = 0.7` with
# `smoothness = 0.6` was picked by eye over a range of both: less
# simplification leaves the staircase visible, more of either starts rubbing
# out the gyral crenellation on the outer edge.
polish_subcortical <- function(atlas) {
  if (is.null(atlas)) {
    return(NULL)
  }
  atlas |>
    ggseg.extra::atlas_simplify(keep = 0.3, exclude = "^cortex") |>
    ggseg.extra::atlas_smooth(smoothness = 0.4, exclude = "^cortex") |>
    ggseg.extra::atlas_simplify(keep = 0.7, labels = "^cortex") |>
    ggseg.extra::atlas_smooth(
      smoothness = 0.6,
      method = "chaikin",
      labels = "^cortex"
    ) |>
    context_first()
}

# ggseg paints the polygons in the order the geometry table holds them, and
# ggseg.extra's `arrange_contour_sf()` only sorts the silhouette down when it
# is named `cortex` or `cortex_`. The sagittal silhouette is named
# `cortex_left` - `cortex_slice_file()` puts the hemisphere in the filename -
# so it misses the match, stays last in the table and is painted over the
# structures. The axial and coronal silhouettes have ventricles and sulci to
# see through, which is why this only shows in the sagittal panel: on CC400 it
# is a blank grey silhouette with all twenty of its structures behind it.
#
# Moving the context to the front of the table - drawn first, so it ends up
# under the structures - fixes the shipped atlases. Drop this once either
# ggsegverse/ggseg.extra#161 lands and the atlases are rebuilt, or
# ggsegverse/ggseg#181 makes geom_brain() reorder at render time the way the
# other render paths already do.
context_first <- function(atlas) {
  context <- setdiff(
    ggseg.formats::atlas_geom(atlas)$label,
    ggseg.formats::atlas_labels(atlas)
  )
  if (!length(context)) {
    return(atlas)
  }
  ggseg.formats::atlas_structure_reorder(atlas, context)
}

# Both build scripts contribute objects to the same R/sysdata.rda. Stash each
# finished atlas in data-raw/atlases/ and rebuild the whole file from the
# stash, so running one script never drops the other's atlases.
atlas_stash_dir <- function() {
  dir <- here::here("data-raw", "atlases")
  dir.create(dir, showWarnings = FALSE, recursive = TRUE)
  dir
}

stash_atlas <- function(name, atlas) {
  if (is.null(atlas)) {
    return(invisible(NULL))
  }
  file <- file.path(atlas_stash_dir(), paste0(sub("^[.]", "", name), ".rds"))
  saveRDS(atlas, file)
  invisible(atlas)
}

write_sysdata <- function() {
  files <- list.files(atlas_stash_dir(), pattern = "[.]rds$", full.names = TRUE)
  if (!length(files)) {
    cli::cli_abort("No stashed atlases in {.path {atlas_stash_dir()}}")
  }
  env <- new.env(parent = emptyenv())
  for (f in files) {
    nm <- paste0(".", sub("[.]rds$", "", basename(f)))
    assign(nm, readRDS(f), envir = env)
  }
  objs <- ls(env, all.names = TRUE)
  cli::cli_alert_success("Writing R/sysdata.rda with {length(objs)} atlases")
  cli::cli_ul(objs)
  save(
    list = objs,
    envir = env,
    file = here::here("R", "sysdata.rda"),
    compress = "xz"
  )
}
