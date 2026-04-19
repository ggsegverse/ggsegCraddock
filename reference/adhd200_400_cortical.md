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
[`adhd200_200_cerebellar()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cerebellar.md),
[`adhd200_200_cortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_cortical.md),
[`adhd200_200_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_200_subcortical.md),
[`adhd200_400_cerebellar()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_cerebellar.md),
[`adhd200_400_subcortical()`](https://ggseg.github.io/ggsegCraddock/reference/adhd200_400_subcortical.md),
[`craddock200_cerebellar()`](https://ggseg.github.io/ggsegCraddock/reference/craddock200_cerebellar.md),
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
#> Views: inferior, lateral, medial, superior
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 201 × 3
#>     hemi  region      label         
#>     <chr> <chr>       <chr>         
#>   1 left  region 0001 lh_region_0001
#>   2 left  region 0012 lh_region_0012
#>   3 left  region 0014 lh_region_0014
#>   4 left  region 0015 lh_region_0015
#>   5 left  region 0018 lh_region_0018
#>   6 left  region 0027 lh_region_0027
#>   7 left  region 0031 lh_region_0031
#>   8 left  region 0044 lh_region_0044
#>   9 left  region 0045 lh_region_0045
#>  10 left  region 0047 lh_region_0047
#>  11 left  region 0051 lh_region_0051
#>  12 left  region 0052 lh_region_0052
#>  13 left  region 0059 lh_region_0059
#>  14 left  region 0063 lh_region_0063
#>  15 left  region 0065 lh_region_0065
#>  16 left  region 0069 lh_region_0069
#>  17 left  region 0070 lh_region_0070
#>  18 left  region 0073 lh_region_0073
#>  19 left  region 0084 lh_region_0084
#>  20 left  region 0086 lh_region_0086
#>  21 left  region 0095 lh_region_0095
#>  22 left  region 0097 lh_region_0097
#>  23 left  region 0098 lh_region_0098
#>  24 left  region 0104 lh_region_0104
#>  25 left  region 0114 lh_region_0114
#>  26 left  region 0120 lh_region_0120
#>  27 left  region 0122 lh_region_0122
#>  28 left  region 0128 lh_region_0128
#>  29 left  region 0133 lh_region_0133
#>  30 left  region 0135 lh_region_0135
#>  31 left  region 0137 lh_region_0137
#>  32 left  region 0142 lh_region_0142
#>  33 left  region 0145 lh_region_0145
#>  34 left  region 0146 lh_region_0146
#>  35 left  region 0148 lh_region_0148
#>  36 left  region 0156 lh_region_0156
#>  37 left  region 0162 lh_region_0162
#>  38 left  region 0167 lh_region_0167
#>  39 left  region 0168 lh_region_0168
#>  40 left  region 0176 lh_region_0176
#>  41 left  region 0177 lh_region_0177
#>  42 left  region 0190 lh_region_0190
#>  43 left  region 0192 lh_region_0192
#>  44 left  region 0198 lh_region_0198
#>  45 left  region 0201 lh_region_0201
#>  46 left  region 0205 lh_region_0205
#>  47 left  region 0208 lh_region_0208
#>  48 left  region 0210 lh_region_0210
#>  49 left  region 0214 lh_region_0214
#>  50 left  region 0223 lh_region_0223
#>  51 left  region 0228 lh_region_0228
#>  52 left  region 0232 lh_region_0232
#>  53 left  region 0233 lh_region_0233
#>  54 left  region 0246 lh_region_0246
#>  55 left  region 0248 lh_region_0248
#>  56 left  region 0249 lh_region_0249
#>  57 left  region 0251 lh_region_0251
#>  58 left  region 0259 lh_region_0259
#>  59 left  region 0261 lh_region_0261
#>  60 left  region 0263 lh_region_0263
#>  61 left  region 0265 lh_region_0265
#>  62 left  region 0267 lh_region_0267
#>  63 left  region 0268 lh_region_0268
#>  64 left  region 0272 lh_region_0272
#>  65 left  region 0276 lh_region_0276
#>  66 left  region 0277 lh_region_0277
#>  67 left  region 0280 lh_region_0280
#>  68 left  region 0281 lh_region_0281
#>  69 left  region 0285 lh_region_0285
#>  70 left  region 0293 lh_region_0293
#>  71 left  region 0296 lh_region_0296
#>  72 left  region 0300 lh_region_0300
#>  73 left  region 0304 lh_region_0304
#>  74 left  region 0305 lh_region_0305
#>  75 left  region 0306 lh_region_0306
#>  76 left  region 0307 lh_region_0307
#>  77 left  region 0308 lh_region_0308
#>  78 left  region 0309 lh_region_0309
#>  79 left  region 0310 lh_region_0310
#>  80 left  region 0313 lh_region_0313
#>  81 left  region 0319 lh_region_0319
#>  82 left  region 0325 lh_region_0325
#>  83 left  region 0326 lh_region_0326
#>  84 left  region 0327 lh_region_0327
#>  85 left  region 0333 lh_region_0333
#>  86 left  region 0335 lh_region_0335
#>  87 left  region 0336 lh_region_0336
#>  88 left  region 0345 lh_region_0345
#>  89 left  region 0346 lh_region_0346
#>  90 left  region 0352 lh_region_0352
#>  91 left  region 0353 lh_region_0353
#>  92 left  region 0354 lh_region_0354
#>  93 left  region 0356 lh_region_0356
#>  94 left  region 0358 lh_region_0358
#>  95 left  region 0366 lh_region_0366
#>  96 left  region 0369 lh_region_0369
#>  97 left  region 0376 lh_region_0376
#>  98 left  region 0391 lh_region_0391
#>  99 left  region 0392 lh_region_0392
#> 100 left  region 0394 lh_region_0394
#> 101 left  region 0396 lh_region_0396
#> 102 left  region 0397 lh_region_0397
#> 103 left  unknown     lh_unknown    
#> 104 right region 0009 rh_region_0009
#> 105 right region 0012 rh_region_0012
#> 106 right region 0013 rh_region_0013
#> 107 right region 0021 rh_region_0021
#> 108 right region 0029 rh_region_0029
#> 109 right region 0033 rh_region_0033
#> 110 right region 0037 rh_region_0037
#> 111 right region 0041 rh_region_0041
#> 112 right region 0045 rh_region_0045
#> 113 right region 0047 rh_region_0047
#> 114 right region 0051 rh_region_0051
#> 115 right region 0054 rh_region_0054
#> 116 right region 0060 rh_region_0060
#> 117 right region 0061 rh_region_0061
#> 118 right region 0064 rh_region_0064
#> 119 right region 0075 rh_region_0075
#> 120 right region 0081 rh_region_0081
#> 121 right region 0086 rh_region_0086
#> 122 right region 0087 rh_region_0087
#> 123 right region 0088 rh_region_0088
#> 124 right region 0093 rh_region_0093
#> 125 right region 0095 rh_region_0095
#> 126 right region 0097 rh_region_0097
#> 127 right region 0098 rh_region_0098
#> 128 right region 0101 rh_region_0101
#> 129 right region 0102 rh_region_0102
#> 130 right region 0106 rh_region_0106
#> 131 right region 0108 rh_region_0108
#> 132 right region 0109 rh_region_0109
#> 133 right region 0121 rh_region_0121
#> 134 right region 0127 rh_region_0127
#> 135 right region 0140 rh_region_0140
#> 136 right region 0144 rh_region_0144
#> 137 right region 0147 rh_region_0147
#> 138 right region 0151 rh_region_0151
#> 139 right region 0154 rh_region_0154
#> 140 right region 0157 rh_region_0157
#> 141 right region 0160 rh_region_0160
#> 142 right region 0162 rh_region_0162
#> 143 right region 0165 rh_region_0165
#> 144 right region 0166 rh_region_0166
#> 145 right region 0172 rh_region_0172
#> 146 right region 0178 rh_region_0178
#> 147 right region 0180 rh_region_0180
#> 148 right region 0190 rh_region_0190
#> 149 right region 0191 rh_region_0191
#> 150 right region 0194 rh_region_0194
#> 151 right region 0195 rh_region_0195
#> 152 right region 0196 rh_region_0196
#> 153 right region 0197 rh_region_0197
#> 154 right region 0202 rh_region_0202
#> 155 right region 0208 rh_region_0208
#> 156 right region 0209 rh_region_0209
#> 157 right region 0218 rh_region_0218
#> 158 right region 0220 rh_region_0220
#> 159 right region 0222 rh_region_0222
#> 160 right region 0225 rh_region_0225
#> 161 right region 0226 rh_region_0226
#> 162 right region 0228 rh_region_0228
#> 163 right region 0231 rh_region_0231
#> 164 right region 0236 rh_region_0236
#> 165 right region 0240 rh_region_0240
#> 166 right region 0249 rh_region_0249
#> 167 right region 0258 rh_region_0258
#> 168 right region 0261 rh_region_0261
#> 169 right region 0263 rh_region_0263
#> 170 right region 0264 rh_region_0264
#> 171 right region 0269 rh_region_0269
#> 172 right region 0273 rh_region_0273
#> 173 right region 0274 rh_region_0274
#> 174 right region 0275 rh_region_0275
#> 175 right region 0285 rh_region_0285
#> 176 right region 0291 rh_region_0291
#> 177 right region 0293 rh_region_0293
#> 178 right region 0294 rh_region_0294
#> 179 right region 0298 rh_region_0298
#> 180 right region 0305 rh_region_0305
#> 181 right region 0307 rh_region_0307
#> 182 right region 0308 rh_region_0308
#> 183 right region 0311 rh_region_0311
#> 184 right region 0314 rh_region_0314
#> 185 right region 0323 rh_region_0323
#> 186 right region 0325 rh_region_0325
#> 187 right region 0330 rh_region_0330
#> 188 right region 0346 rh_region_0346
#> 189 right region 0351 rh_region_0351
#> 190 right region 0354 rh_region_0354
#> 191 right region 0358 rh_region_0358
#> 192 right region 0359 rh_region_0359
#> 193 right region 0361 rh_region_0361
#> 194 right region 0371 rh_region_0371
#> 195 right region 0378 rh_region_0378
#> 196 right region 0383 rh_region_0383
#> 197 right region 0384 rh_region_0384
#> 198 right region 0390 rh_region_0390
#> 199 right region 0393 rh_region_0393
#> 200 right region 0395 rh_region_0395
#> 201 right unknown     rh_unknown    
plot(adhd200_400_cortical())
```
