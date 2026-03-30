#' Craddock 200 Cortical Parcellation
#'
#' Cortical regions from the Craddock 200-parcel spatially constrained
#' spectral clustering parcellation (Craddock et al., 2012).
#' Contains 2D polygon geometry for [ggseg::geom_brain()] and
#' 3D vertex indices for [ggseg3d::ggseg3d()].
#'
#' @family ggseg_atlases
#'
#' @references Craddock RC et al. (2012). A whole brain fMRI atlas
#'   generated via spatially constrained spectral clustering.
#'   \doi{10.1002/hbm.21333}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @import ggseg.formats
#' @export
#' @examples
#' craddock200_cortical()
craddock200_cortical <- function() .craddock200_cortical
#' Craddock 200 Subcortical Parcellation
#'
#' Subcortical regions from the Craddock 200-parcel spatially constrained
#' spectral clustering parcellation (Craddock et al., 2012).
#' Contains 2D polygon geometry and 3D meshes.
#'
#' @family ggseg_atlases
#'
#' @references Craddock RC et al. (2012). A whole brain fMRI atlas
#'   generated via spatially constrained spectral clustering.
#'   \doi{10.1002/hbm.21333}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @export
#' @examples
#' craddock200_subcortical()
craddock200_subcortical <- function() .craddock200_subcortical
#' ADHD-200 CC200 Cortical Atlas
#'
#' Cortical parcellation from the Craddock CC200 spatially constrained
#' spectral clustering of 650 ADHD-200 subjects.
#'
#' @family ggseg_atlases
#' @references Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
#'   \doi{10.1002/hbm.21333}
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @import ggseg.formats
#' @export
#' @examples
#' adhd200_200_cortical()
#' plot(adhd200_200_cortical())
adhd200_200_cortical <- function() .adhd200_200_cortical

#' ADHD-200 CC200 Subcortical Atlas
#'
#' Subcortical parcellation from the Craddock CC200 clustering.
#'
#' @family ggseg_atlases
#' @references Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
#'   \doi{10.1002/hbm.21333}
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @export
#' @examples
#' adhd200_200_subcortical()
#' plot(adhd200_200_subcortical())
adhd200_200_subcortical <- function() .adhd200_200_subcortical

#' ADHD-200 CC400 Cortical Atlas
#'
#' Cortical parcellation from the Craddock CC400 spatially constrained
#' spectral clustering of 650 ADHD-200 subjects.
#'
#' @family ggseg_atlases
#' @references Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
#'   \doi{10.1002/hbm.21333}
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @export
#' @examples
#' adhd200_400_cortical()
#' plot(adhd200_400_cortical())
adhd200_400_cortical <- function() .adhd200_400_cortical

#' ADHD-200 CC400 Subcortical Atlas
#'
#' Subcortical parcellation from the Craddock CC400 clustering.
#'
#' @family ggseg_atlases
#' @references Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
#'   \doi{10.1002/hbm.21333}
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @export
#' @examples
#' adhd200_400_subcortical()
#' plot(adhd200_400_subcortical())
adhd200_400_subcortical <- function() .adhd200_400_subcortical
