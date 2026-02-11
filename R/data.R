#' Craddock 200 Cortical Parcellation
#'
#' Cortical regions from the Craddock 200-parcel spatially constrained
#' spectral clustering parcellation (Craddock et al., 2012).
#' Contains 2D polygon geometry for [ggseg::geom_brain()] and
#' 3D vertex indices for [ggseg3d::ggseg3d()].
#'
#' @docType data
#' @name craddock200_cortical
#' @usage data(craddock200_cortical)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Craddock RC et al. (2012). A whole brain fMRI atlas
#'   generated via spatially constrained spectral clustering.
#'   \doi{10.1002/hbm.21333}
#'
#' @format A [ggseg.formats::ggseg_atlas] object (cortical).
#' @examples
#' data(craddock200_cortical)
#' craddock200_cortical
"craddock200_cortical"

#' Craddock 200 Subcortical Parcellation
#'
#' Subcortical regions from the Craddock 200-parcel spatially constrained
#' spectral clustering parcellation (Craddock et al., 2012).
#' Contains 2D polygon geometry and 3D meshes.
#'
#' @docType data
#' @name craddock200_subcortical
#' @usage data(craddock200_subcortical)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Craddock RC et al. (2012). A whole brain fMRI atlas
#'   generated via spatially constrained spectral clustering.
#'   \doi{10.1002/hbm.21333}
#'
#' @format A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @examples
#' data(craddock200_subcortical)
#' craddock200_subcortical
"craddock200_subcortical"
