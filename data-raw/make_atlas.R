library(ggseg.extra)
library(ggseg.formats)


cli::cli_h1("Creating Craddock 200-parcel atlas")

  nifti_4d <- RNifti::readNifti(
    here::here("data-raw", "tcorr05_2level_all.nii.gz")
  )
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

atlases <- create_wholebrain_from_volume(
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

.craddock200_cortical <- atlases$cortical
.craddock200_subcortical <- atlases$subcortical
.craddock200_cerebellar <- atlases$cerebellar

print(.craddock200_cortical)
plot(.craddock200_cortical)
print(.craddock200_subcortical)
plot(.craddock200_subcortical)

if (!is.null(.craddock200_cerebellar)) {
  print(.craddock200_cerebellar)
  plot(.craddock200_cerebellar)
  usethis::use_data(.craddock200_cortical, .craddock200_subcortical,
    .craddock200_cerebellar, overwrite = TRUE, compress = "xz", internal = TRUE)
} else {
  usethis::use_data(.craddock200_cortical, .craddock200_subcortical,
    overwrite = TRUE, compress = "xz", internal = TRUE)
}
