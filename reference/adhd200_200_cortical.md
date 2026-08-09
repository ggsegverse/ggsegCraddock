# ADHD-200 CC200 Cortical Atlas

Cortical parcellation from the Craddock CC200 spatially constrained
spectral clustering of 650 ADHD-200 subjects.

## Usage

``` r
adhd200_200_cortical()
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
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md),
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md),
[`craddock200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_subcortical.md)

Other cortical_atlases:
[`adhd200_400_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cortical.md),
[`craddock200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cortical.md)

## Examples

``` r
adhd200_200_cortical()
#> 
#> ── adhd200_200_cortical ggseg atlas ────────────────────────────────────────────
#> Type: cortical
#> Regions: 150
#> Hemispheres: left, right
#> Views: inferior, lateral, superior, medial
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi      region          label
#> 1  left region 0008 lh_region_0008
#> 2  left region 0013 lh_region_0013
#> 3  left region 0016 lh_region_0016
#> 4  left region 0017 lh_region_0017
#> 5  left region 0021 lh_region_0021
#> 6  left region 0027 lh_region_0027
#> 7  left region 0028 lh_region_0028
#> 8  left region 0032 lh_region_0032
#> 9  left region 0036 lh_region_0036
#> 10 left region 0037 lh_region_0037
#> ... with 159 more rows
```
