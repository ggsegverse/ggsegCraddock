# ADHD-200 CC200 Subcortical Atlas

Subcortical parcellation from the Craddock CC200 clustering.

## Usage

``` r
adhd200_200_subcortical()
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
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md),
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

Other subcortical_atlases:
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

## Examples

``` r
adhd200_200_subcortical()
#> 
#> ── adhd200_200_subcortical ggseg atlas ─────────────────────────────────────────
#> Type: subcortical
#> Regions: 15
#> Hemispheres: NA
#> Views: axial_1, axial_2, coronal_1, sagittal
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (meshes)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi      region       label
#> 1  <NA> region 0003 region_0003
#> 2  <NA> region 0009 region_0009
#> 3  <NA> region 0014 region_0014
#> 4  <NA> region 0019 region_0019
#> 5  <NA> region 0031 region_0031
#> 6  <NA> region 0038 region_0038
#> 7  <NA> region 0045 region_0045
#> 8  <NA> region 0065 region_0065
#> 9  <NA> region 0069 region_0069
#> 10 <NA> region 0098 region_0098
#> ... with 5 more rows
```
