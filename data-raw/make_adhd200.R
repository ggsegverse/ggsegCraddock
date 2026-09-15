# Create ADHD-200 Parcellation Atlases
#
# Source: https://www.nitrc.org/frs/?group_id=427
# Reference: Craddock RC, et al. (2012). Human Brain Mapping, 33(8):1914-1928.
# Date obtained: 2026-03-28
#
# Run with: Rscript data-raw/make_adhd200.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
source(here::here("data-raw", "helpers.R"))

for (res in c(200, 400)) {
  cli::cli_h1("Creating ADHD-200 {res}-parcel atlas")

  volume_file <- here::here(
    "data-raw",
    "source",
    paste0("ADHD200_parcellate_", res, ".nii.gz")
  )

  split <- classify_parcels(
    volume_file,
    label_fmt = "region_%04d",
    cache_file = here::here(
      "data-raw",
      paste0("aparc_aseg_on_adhd200_", res, ".nii.gz")
    )
  )
  cli::cli_alert_info(
    "{length(split$cortical)} cortical, {length(split$cerebellar)} cerebellar
     parcel{?s} by anatomy"
  )

  # Steps 1-4 only; see make_atlas.R for why the cerebellum is built apart.
  atlases <- create_wholebrain_from_volume(
    input_volume = volume_file,
    atlas_name = paste0("adhd200_", res),
    output_dir = "data-raw",
    registration = "header",
    cortical_labels = split$cortical,
    cerebellar_labels = split$cerebellar,
    subcortical_opts = list(decimate = 0.5),
    steps = 1:4,
    skip_existing = TRUE,
    cleanup = FALSE,
    verbose = TRUE
  )

  cerebellar <- build_cerebellar(
    volume_file,
    cerebellar_labels = split$cerebellar,
    label_fmt = "region_%04d",
    atlas_name = paste0("adhd200_", res, "_cerebellar"),
    output_dir = "data-raw"
  )

  stash_atlas(
    paste0(".adhd200_", res, "_cortical"),
    distinct_palette(atlases$cortical, seed = res + 1)
  )
  stash_atlas(
    paste0(".adhd200_", res, "_subcortical"),
    distinct_palette(polish_subcortical(atlases$subcortical), seed = res + 2)
  )
  stash_atlas(
    paste0(".adhd200_", res, "_cerebellar"),
    distinct_palette(cerebellar, seed = res + 3)
  )

  print(atlases$cortical)
  print(atlases$subcortical)
  print(cerebellar)
}

write_sysdata()
