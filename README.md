# ggsegCraddock

Craddock spatially constrained clustering parcellation for the ggseg plotting ecosystem.

This package provides the Craddock 2011 whole-brain parcellation atlas formatted for use with ggseg and ggseg3d. The atlas is based on spatially constrained spectral clustering of resting-state fMRI data.

## Installation

Install from the ggseg r-universe:

```r
options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("ggsegCraddock")
```

Or install from GitHub:

```r
# install.packages("remotes")
remotes::install_github("ggseg/ggsegCraddock")
```

## Usage

```r
library(ggseg)
library(ggsegCraddock)

plot(craddock200)
```

## Source Data

The parcellation NIfTI files were obtained from NITRC:

<https://www.nitrc.org/frs/?group_id=383>

The `tcorr05_2level_all.nii.gz` file was used, extracting the first volume (~200 parcels) from the 4D NIfTI. Five parcellation variants are available in the archive: `random`, `scorr05_2level`, `scorr05_mean`, `tcorr05_2level`, and `tcorr05_mean`.

## Reference

Craddock RC, James GA, Holtzheimer PE, Hu XP, Mayberg HS (2012). "A whole brain fMRI atlas generated via spatially constrained spectral clustering." *Human Brain Mapping*, 33(8):1914-1928. doi: [10.1002/hbm.21333](https://doi.org/10.1002/hbm.21333)

## Code of Conduct

Please note that the ggsegCraddock project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
