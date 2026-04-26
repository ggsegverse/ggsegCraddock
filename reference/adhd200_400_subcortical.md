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
#> # A tibble: 72 × 3
#>    hemi  region      label      
#>    <chr> <chr>       <chr>      
#>  1 NA    region 0003 region_0003
#>  2 NA    region 0004 region_0004
#>  3 NA    region 0006 region_0006
#>  4 NA    region 0008 region_0008
#>  5 NA    region 0011 region_0011
#>  6 NA    region 0020 region_0020
#>  7 NA    region 0023 region_0023
#>  8 NA    region 0024 region_0024
#>  9 NA    region 0025 region_0025
#> 10 NA    region 0026 region_0026
#> 11 NA    region 0028 region_0028
#> 12 NA    region 0030 region_0030
#> 13 NA    region 0032 region_0032
#> 14 NA    region 0035 region_0035
#> 15 NA    region 0050 region_0050
#> 16 NA    region 0055 region_0055
#> 17 NA    region 0057 region_0057
#> 18 NA    region 0058 region_0058
#> 19 NA    region 0062 region_0062
#> 20 NA    region 0067 region_0067
#> 21 NA    region 0072 region_0072
#> 22 NA    region 0074 region_0074
#> 23 NA    region 0078 region_0078
#> 24 NA    region 0082 region_0082
#> 25 NA    region 0089 region_0089
#> 26 NA    region 0090 region_0090
#> 27 NA    region 0094 region_0094
#> 28 NA    region 0096 region_0096
#> 29 NA    region 0100 region_0100
#> 30 NA    region 0103 region_0103
#> 31 NA    region 0107 region_0107
#> 32 NA    region 0112 region_0112
#> 33 NA    region 0113 region_0113
#> 34 NA    region 0115 region_0115
#> 35 NA    region 0117 region_0117
#> 36 NA    region 0119 region_0119
#> 37 NA    region 0124 region_0124
#> 38 NA    region 0132 region_0132
#> 39 NA    region 0134 region_0134
#> 40 NA    region 0141 region_0141
#> 41 NA    region 0150 region_0150
#> 42 NA    region 0152 region_0152
#> 43 NA    region 0153 region_0153
#> 44 NA    region 0158 region_0158
#> 45 NA    region 0159 region_0159
#> 46 NA    region 0161 region_0161
#> 47 NA    region 0163 region_0163
#> 48 NA    region 0170 region_0170
#> 49 NA    region 0173 region_0173
#> 50 NA    region 0181 region_0181
#> 51 NA    region 0182 region_0182
#> 52 NA    region 0183 region_0183
#> 53 NA    region 0184 region_0184
#> 54 NA    region 0187 region_0187
#> 55 NA    region 0188 region_0188
#> 56 NA    region 0189 region_0189
#> 57 NA    region 0207 region_0207
#> 58 NA    region 0211 region_0211
#> 59 NA    region 0212 region_0212
#> 60 NA    region 0213 region_0213
#> 61 NA    region 0215 region_0215
#> 62 NA    region 0217 region_0217
#> 63 NA    region 0221 region_0221
#> 64 NA    region 0227 region_0227
#> 65 NA    region 0230 region_0230
#> 66 NA    region 0241 region_0241
#> 67 NA    region 0243 region_0243
#> 68 NA    region 0244 region_0244
#> 69 NA    region 0247 region_0247
#> 70 NA    region 0250 region_0250
#> 71 NA    region 0252 region_0252
#> 72 NA    region 0255 region_0255
```
