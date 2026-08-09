# ADHD-200 CC400 Cortical Atlas

Cortical parcellation from the Craddock CC400 spatially constrained
spectral clustering of 650 ADHD-200 subjects.

## Usage

``` r
adhd200_400_cortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (cortical).

## References

Craddock RC, et al. (2012). *Human Brain Mapping*, 33(8):1914-1928.
[doi:10.1002/hbm.21333](https://doi.org/10.1002/hbm.21333)

## See also

Other ggseg_atlases:
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

Other cortical_atlases:
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md)

## Examples

``` r
adhd200_400_cortical()
#> 
#> ── adhd200_400_cortical ggseg atlas ────────────────────────────────────────────
#> Type: cortical
#> Regions: 176
#> Hemispheres: left, right
#> Views: inferior, lateral, superior, medial
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi      region          label
#> 1  left region 0001 lh_region_0001
#> 2  left region 0012 lh_region_0012
#> 3  left region 0014 lh_region_0014
#> 4  left region 0015 lh_region_0015
#> 5  left region 0018 lh_region_0018
#> 6  left region 0027 lh_region_0027
#> 7  left region 0031 lh_region_0031
#> 8  left region 0044 lh_region_0044
#> 9  left region 0045 lh_region_0045
#> 10 left region 0047 lh_region_0047
#> ... with 191 more rows
```
