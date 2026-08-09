# ADHD-200 CC400 Subcortical Atlas

Subcortical parcellation from the Craddock CC400 clustering.

## Usage

``` r
adhd200_400_subcortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (subcortical).

## References

Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
[doi:10.1002/hbm.21333](https://doi.org/10.1002/hbm.21333)

## See also

Other ggseg_atlases:
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

Other subcortical_atlases:
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

## Examples

``` r
adhd200_400_subcortical()
#> 
#> ── adhd200_400_subcortical ggseg atlas ─────────────────────────────────────────
#> Type: subcortical
#> Regions: 72
#> Hemispheres: NA
#> Views: axial_1, axial_2, coronal_1, sagittal
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (meshes)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi      region       label
#> 1  <NA> region 0003 region_0003
#> 2  <NA> region 0004 region_0004
#> 3  <NA> region 0006 region_0006
#> 4  <NA> region 0008 region_0008
#> 5  <NA> region 0011 region_0011
#> 6  <NA> region 0020 region_0020
#> 7  <NA> region 0023 region_0023
#> 8  <NA> region 0024 region_0024
#> 9  <NA> region 0025 region_0025
#> 10 <NA> region 0026 region_0026
#> ... with 62 more rows
```
