# Craddock 200 Cortical Parcellation

Cortical regions from the Craddock 200-parcel spatially constrained
spectral clustering parcellation (Craddock et al., 2012). Contains 2D
polygon geometry for
[`ggseg::geom_brain()`](https://ggsegverse.github.io/ggseg/reference/ggbrain.html)
and 3D vertex indices for
[`ggseg3d::ggseg3d()`](https://ggsegverse.github.io/ggseg3d/reference/ggseg3d.html).

## Usage

``` r
craddock200_cortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (cortical).

## References

Craddock RC et al. (2012). A whole brain fMRI atlas generated via
spatially constrained spectral clustering.
[doi:10.1002/hbm.21333](https://doi.org/10.1002/hbm.21333)

## See also

Other ggseg_atlases:
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

## Examples

``` r
craddock200_cortical()
#> Error in craddock200_cortical(): object '.craddock200_cortical' not found
```
