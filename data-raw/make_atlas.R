library(dplyr)
library(ggsegExtra)
library(ggseg.formats)

future::plan(future::multisession(workers = 4))
progressr::handlers("cli")
progressr::handlers(global = TRUE)

cli::cli_h1("Creating Craddock 200-parcel atlas")

nifti_4d <- RNifti::readNifti(here::here("data-raw", "tcorr05_2level_all.nii.gz"))
parcellation_3d <- nifti_4d[, , , 20]

volume_file <- here::here("data-raw", "tcorr05_2level_200.nii.gz")
RNifti::writeNifti(parcellation_3d, volume_file, template = nifti_4d)

parcel_ids <- sort(unique(as.integer(parcellation_3d[parcellation_3d > 0])))
cli::cli_alert_info("Found {length(parcel_ids)} parcels in first volume")

lut_file <- here::here("data-raw", "Craddock200_LUT.txt")
writeLines(
  paste(parcel_ids, sprintf("Parcel_%03d", parcel_ids), 0, 0, 0, 0),
  lut_file
)

atlases <- create_wholebrain_atlas(
  input_volume = volume_file,
  input_lut = lut_file,
  atlas_name = "craddock200",
  output_dir = "data-raw/craddock200",
  regheader = TRUE,
  tolerance = 1,
  smoothness = 2,
  decimate = 0.5,
  skip_existing = TRUE,
  cleanup = FALSE,
  verbose = TRUE
)

craddock200_cortical <- atlases$cortical
craddock200_subcortical <- atlases$subcortical

cli::cli_alert_success("Cortical: {nrow(craddock200_cortical$core)} regions")
cli::cli_alert_success("Subcortical: {nrow(craddock200_subcortical$core)} regions")

brain_pals <- stats::setNames(
  list(craddock200_cortical$palette, craddock200_subcortical$palette),
  c(craddock200_cortical$atlas, craddock200_subcortical$atlas)
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")

usethis::use_data(craddock200_cortical, craddock200_subcortical,
  overwrite = TRUE, compress = "xz")
cli::cli_alert_success("Saved to data/")
