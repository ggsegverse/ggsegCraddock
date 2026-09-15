# Create Craddock 200-parcel atlas
#
# Source: https://ccraddock.github.io/cluster_roi/atlases.html
# Reference: Craddock RC, et al. (2012). Human Brain Mapping, 33(8):1914-1928.
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")
source(here::here("data-raw", "helpers.R"))

cli::cli_h1("Creating Craddock 200-parcel atlas")

nifti_4d <- RNifti::readNifti(
  here::here("data-raw", "tcorr05_2level_all.nii.gz")
)
parcellation_3d <- nifti_4d[,,, 20]

volume_file <- here::here("data-raw", "tcorr05_2level_200.nii.gz")
RNifti::writeNifti(parcellation_3d, volume_file, template = nifti_4d)

parcel_ids <- sort(unique(as.integer(parcellation_3d[parcellation_3d > 0])))
cli::cli_alert_info("Found {length(parcel_ids)} parcels in first volume")

lut_file <- here::here("data-raw", "Craddock200_LUT.txt")
writeLines(
  paste(parcel_ids, sprintf("Parcel_%03d", parcel_ids), 0, 0, 0, 0),
  lut_file
)

cli::cli_h2("Classifying parcels against aparc+aseg")
split <- classify_parcels(
  volume_file,
  label_fmt = "Parcel_%03d",
  cache_file = here::here("data-raw", "aparc_aseg_on_craddock.nii.gz")
)
cli::cli_alert_info(
  "{length(split$cortical)} cortical, {length(split$cerebellar)} cerebellar
   parcel{?s} by anatomy"
)

# Steps 1-4 only: the cerebellar parcels are held out of the subcortical
# atlas here, but built below rather than by the pipeline's step 5, which
# would hand them to the SUIT flatmap still in MNI space.
atlases <- create_wholebrain_from_volume(
  input_volume = volume_file,
  input_lut = lut_file,
  atlas_name = "craddock200",
  output_dir = "data-raw/craddock200",
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
  label_fmt = "Parcel_%03d",
  atlas_name = "craddock200_cerebellar",
  output_dir = "data-raw/craddock200"
)

.craddock200_cortical <- distinct_palette(atlases$cortical, seed = 11)
.craddock200_subcortical <- distinct_palette(
  polish_subcortical(atlases$subcortical),
  seed = 12
)
.craddock200_cerebellar <- distinct_palette(cerebellar, seed = 13)

print(.craddock200_cortical)
print(.craddock200_subcortical)
print(.craddock200_cerebellar)

stash_atlas(".craddock200_cortical", .craddock200_cortical)
stash_atlas(".craddock200_subcortical", .craddock200_subcortical)
stash_atlas(".craddock200_cerebellar", .craddock200_cerebellar)
write_sysdata()
