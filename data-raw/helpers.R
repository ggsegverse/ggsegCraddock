# Shared helpers for the Craddock and ADHD-200 atlas builds.

# The Craddock-family lookup tables carry no anatomical `type`, so
# create_wholebrain_from_volume() falls back to counting surface vertices, and
# at 4 mm a run of genuinely cortical parcels hugging the midline project to
# fewer than `min_vertices` vertices. They then land in the subcortical
# atlas as free-floating blobs over the cortex. Settle those cases on anatomy:
# resample FreeSurfer's aparc+aseg onto the parcellation grid and force any
# parcel that overlaps cortical ribbon substantially, and subcortical grey
# hardly at all, to be cortical. The test is deliberately relative: absolute
# ribbon overlap varies with parcel size, but a cortical parcel never sits in
# the basal ganglia, thalamus or ventricles.
cortical_ribbon_labels <- function(
  volume_file,
  label_fmt = "Parcel_%03d",
  min_cortical = 0.25,
  cortical_ratio = 5,
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
  fractions <- vapply(
    label_ids,
    function(id) {
      hit <- aseg[parcellation == id]
      c(
        cortex = mean(hit >= 1000 | hit %in% c(3L, 42L)),
        subcortex = mean(hit %in% subcortical_grey)
      )
    },
    numeric(2)
  )

  is_cortical <- fractions["cortex", ] >= min_cortical &
    fractions["cortex", ] > cortical_ratio * fractions["subcortex", ]
  sprintf(label_fmt, label_ids[is_cortical])
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
# automatically: reduce vertices first, then round the contours.
polish_subcortical <- function(atlas, keep = 0.3) {
  if (is.null(atlas)) {
    return(NULL)
  }
  ggseg.extra::atlas_smooth(ggseg.extra::atlas_simplify(atlas, keep = keep))
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
