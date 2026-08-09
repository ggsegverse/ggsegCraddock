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
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md),
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

Other cortical_atlases:
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md)

## Examples

``` r
craddock200_cortical()
#> 
#> ── craddock200_cortical ggseg atlas ────────────────────────────────────────────
#> Type: cortical
#> Regions: 169
#> Hemispheres: left, right
#> Views: inferior, lateral, superior, medial
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi     region         label
#> 1  left parcel 001 lh_Parcel_001
#> 2  left parcel 002 lh_Parcel_002
#> 3  left parcel 004 lh_Parcel_004
#> 4  left parcel 005 lh_Parcel_005
#> 5  left parcel 008 lh_Parcel_008
#> 6  left parcel 011 lh_Parcel_011
#> 7  left parcel 013 lh_Parcel_013
#> 8  left parcel 016 lh_Parcel_016
#> 9  left parcel 019 lh_Parcel_019
#> 10 left parcel 020 lh_Parcel_020
#> ... with 182 more rows
```
