# Craddock 200 Subcortical Parcellation

Subcortical regions from the Craddock 200-parcel spatially constrained
spectral clustering parcellation (Craddock et al., 2012). Contains 2D
polygon geometry and 3D meshes.

## Usage

``` r
craddock200_subcortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (subcortical).

## References

Craddock RC et al. (2012). A whole brain fMRI atlas generated via
spatially constrained spectral clustering.
[doi:10.1002/hbm.21333](https://doi.org/10.1002/hbm.21333)

## See also

Other ggseg_atlases:
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md)

## Examples

``` r
craddock200_subcortical()
#> 
#> ── craddock200_subcortical ggseg atlas ─────────────────────────────────────────
#> Type: subcortical
#> Regions: 14
#> Hemispheres: NA
#> Views: axial_1, axial_2, coronal_1, sagittal
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (meshes)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 14 × 3
#>    hemi  region     label     
#>    <chr> <chr>      <chr>     
#>  1 NA    parcel 041 Parcel_041
#>  2 NA    parcel 045 Parcel_045
#>  3 NA    parcel 047 Parcel_047
#>  4 NA    parcel 067 Parcel_067
#>  5 NA    parcel 083 Parcel_083
#>  6 NA    parcel 091 Parcel_091
#>  7 NA    parcel 103 Parcel_103
#>  8 NA    parcel 139 Parcel_139
#>  9 NA    parcel 152 Parcel_152
#> 10 NA    parcel 169 Parcel_169
#> 11 NA    parcel 178 Parcel_178
#> 12 NA    parcel 190 Parcel_190
#> 13 NA    parcel 194 Parcel_194
#> 14 NA    parcel 196 Parcel_196
```
