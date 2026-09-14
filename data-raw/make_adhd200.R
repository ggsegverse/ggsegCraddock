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

  cortical_labels <- cortical_ribbon_labels(
    volume_file,
    label_fmt = "region_%04d",
    cache_file = here::here(
      "data-raw",
      paste0("aparc_aseg_on_adhd200_", res, ".nii.gz")
    )
  )
  cli::cli_alert_info(
    "{length(cortical_labels)} parcel{?s} are majority cortical ribbon"
  )

  atlases <- create_wholebrain_from_volume(
    input_volume = volume_file,
    atlas_name = paste0("adhd200_", res),
    output_dir = "data-raw",
    registration = "header",
    cortical_labels = cortical_labels,
    subcortical_opts = list(decimate = 0.5),
    skip_existing = TRUE,
    cleanup = FALSE,
    verbose = TRUE
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
    distinct_palette(atlases$cerebellar, seed = res + 3)
  )

  print(atlases$cortical)
  print(atlases$subcortical)
}

write_sysdata()
