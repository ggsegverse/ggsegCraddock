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
#> Views: inferior, lateral, medial, superior
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 169 × 3
#>     hemi  region      label         
#>     <chr> <chr>       <chr>         
#>   1 left  region 0008 lh_region_0008
#>   2 left  region 0013 lh_region_0013
#>   3 left  region 0016 lh_region_0016
#>   4 left  region 0017 lh_region_0017
#>   5 left  region 0021 lh_region_0021
#>   6 left  region 0027 lh_region_0027
#>   7 left  region 0028 lh_region_0028
#>   8 left  region 0032 lh_region_0032
#>   9 left  region 0036 lh_region_0036
#>  10 left  region 0037 lh_region_0037
#>  11 left  region 0043 lh_region_0043
#>  12 left  region 0048 lh_region_0048
#>  13 left  region 0051 lh_region_0051
#>  14 left  region 0052 lh_region_0052
#>  15 left  region 0054 lh_region_0054
#>  16 left  region 0055 lh_region_0055
#>  17 left  region 0056 lh_region_0056
#>  18 left  region 0063 lh_region_0063
#>  19 left  region 0066 lh_region_0066
#>  20 left  region 0067 lh_region_0067
#>  21 left  region 0071 lh_region_0071
#>  22 left  region 0073 lh_region_0073
#>  23 left  region 0075 lh_region_0075
#>  24 left  region 0077 lh_region_0077
#>  25 left  region 0080 lh_region_0080
#>  26 left  region 0081 lh_region_0081
#>  27 left  region 0083 lh_region_0083
#>  28 left  region 0085 lh_region_0085
#>  29 left  region 0086 lh_region_0086
#>  30 left  region 0087 lh_region_0087
#>  31 left  region 0089 lh_region_0089
#>  32 left  region 0092 lh_region_0092
#>  33 left  region 0093 lh_region_0093
#>  34 left  region 0096 lh_region_0096
#>  35 left  region 0097 lh_region_0097
#>  36 left  region 0099 lh_region_0099
#>  37 left  region 0103 lh_region_0103
#>  38 left  region 0107 lh_region_0107
#>  39 left  region 0109 lh_region_0109
#>  40 left  region 0111 lh_region_0111
#>  41 left  region 0113 lh_region_0113
#>  42 left  region 0114 lh_region_0114
#>  43 left  region 0116 lh_region_0116
#>  44 left  region 0120 lh_region_0120
#>  45 left  region 0122 lh_region_0122
#>  46 left  region 0124 lh_region_0124
#>  47 left  region 0127 lh_region_0127
#>  48 left  region 0128 lh_region_0128
#>  49 left  region 0130 lh_region_0130
#>  50 left  region 0131 lh_region_0131
#>  51 left  region 0133 lh_region_0133
#>  52 left  region 0135 lh_region_0135
#>  53 left  region 0137 lh_region_0137
#>  54 left  region 0139 lh_region_0139
#>  55 left  region 0141 lh_region_0141
#>  56 left  region 0144 lh_region_0144
#>  57 left  region 0147 lh_region_0147
#>  58 left  region 0148 lh_region_0148
#>  59 left  region 0152 lh_region_0152
#>  60 left  region 0154 lh_region_0154
#>  61 left  region 0156 lh_region_0156
#>  62 left  region 0157 lh_region_0157
#>  63 left  region 0160 lh_region_0160
#>  64 left  region 0165 lh_region_0165
#>  65 left  region 0166 lh_region_0166
#>  66 left  region 0167 lh_region_0167
#>  67 left  region 0168 lh_region_0168
#>  68 left  region 0171 lh_region_0171
#>  69 left  region 0172 lh_region_0172
#>  70 left  region 0174 lh_region_0174
#>  71 left  region 0175 lh_region_0175
#>  72 left  region 0176 lh_region_0176
#>  73 left  region 0177 lh_region_0177
#>  74 left  region 0178 lh_region_0178
#>  75 left  region 0179 lh_region_0179
#>  76 left  region 0180 lh_region_0180
#>  77 left  region 0186 lh_region_0186
#>  78 left  region 0188 lh_region_0188
#>  79 left  region 0189 lh_region_0189
#>  80 left  region 0190 lh_region_0190
#>  81 left  region 0193 lh_region_0193
#>  82 left  region 0197 lh_region_0197
#>  83 left  region 0198 lh_region_0198
#>  84 left  unknown     lh_unknown    
#>  85 right region 0004 rh_region_0004
#>  86 right region 0006 rh_region_0006
#>  87 right region 0007 rh_region_0007
#>  88 right region 0010 rh_region_0010
#>  89 right region 0012 rh_region_0012
#>  90 right region 0013 rh_region_0013
#>  91 right region 0018 rh_region_0018
#>  92 right region 0020 rh_region_0020
#>  93 right region 0022 rh_region_0022
#>  94 right region 0023 rh_region_0023
#>  95 right region 0024 rh_region_0024
#>  96 right region 0029 rh_region_0029
#>  97 right region 0035 rh_region_0035
#>  98 right region 0037 rh_region_0037
#>  99 right region 0039 rh_region_0039
#> 100 right region 0041 rh_region_0041
#> 101 right region 0042 rh_region_0042
#> 102 right region 0044 rh_region_0044
#> 103 right region 0046 rh_region_0046
#> 104 right region 0047 rh_region_0047
#> 105 right region 0053 rh_region_0053
#> 106 right region 0054 rh_region_0054
#> 107 right region 0058 rh_region_0058
#> 108 right region 0059 rh_region_0059
#> 109 right region 0060 rh_region_0060
#> 110 right region 0062 rh_region_0062
#> 111 right region 0064 rh_region_0064
#> 112 right region 0067 rh_region_0067
#> 113 right region 0070 rh_region_0070
#> 114 right region 0072 rh_region_0072
#> 115 right region 0074 rh_region_0074
#> 116 right region 0076 rh_region_0076
#> 117 right region 0078 rh_region_0078
#> 118 right region 0080 rh_region_0080
#> 119 right region 0084 rh_region_0084
#> 120 right region 0089 rh_region_0089
#> 121 right region 0090 rh_region_0090
#> 122 right region 0094 rh_region_0094
#> 123 right region 0096 rh_region_0096
#> 124 right region 0100 rh_region_0100
#> 125 right region 0101 rh_region_0101
#> 126 right region 0106 rh_region_0106
#> 127 right region 0107 rh_region_0107
#> 128 right region 0110 rh_region_0110
#> 129 right region 0112 rh_region_0112
#> 130 right region 0115 rh_region_0115
#> 131 right region 0117 rh_region_0117
#> 132 right region 0118 rh_region_0118
#> 133 right region 0119 rh_region_0119
#> 134 right region 0120 rh_region_0120
#> 135 right region 0123 rh_region_0123
#> 136 right region 0129 rh_region_0129
#> 137 right region 0130 rh_region_0130
#> 138 right region 0132 rh_region_0132
#> 139 right region 0134 rh_region_0134
#> 140 right region 0135 rh_region_0135
#> 141 right region 0136 rh_region_0136
#> 142 right region 0138 rh_region_0138
#> 143 right region 0140 rh_region_0140
#> 144 right region 0142 rh_region_0142
#> 145 right region 0146 rh_region_0146
#> 146 right region 0147 rh_region_0147
#> 147 right region 0150 rh_region_0150
#> 148 right region 0154 rh_region_0154
#> 149 right region 0155 rh_region_0155
#> 150 right region 0160 rh_region_0160
#> 151 right region 0161 rh_region_0161
#> 152 right region 0162 rh_region_0162
#> 153 right region 0163 rh_region_0163
#> 154 right region 0170 rh_region_0170
#> 155 right region 0173 rh_region_0173
#> 156 right region 0174 rh_region_0174
#> 157 right region 0177 rh_region_0177
#> 158 right region 0181 rh_region_0181
#> 159 right region 0182 rh_region_0182
#> 160 right region 0184 rh_region_0184
#> 161 right region 0185 rh_region_0185
#> 162 right region 0186 rh_region_0186
#> 163 right region 0187 rh_region_0187
#> 164 right region 0194 rh_region_0194
#> 165 right region 0195 rh_region_0195
#> 166 right region 0198 rh_region_0198
#> 167 right region 0199 rh_region_0199
#> 168 right region 0200 rh_region_0200
#> 169 right unknown     rh_unknown    
```
