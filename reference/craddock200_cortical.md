# Craddock 200 Cortical Parcellation

Cortical regions from the Craddock 200-parcel spatially constrained
spectral clustering parcellation (Craddock et al., 2012). Contains 2D
polygon geometry for
[`ggseg::geom_brain()`](https://ggsegverse.github.io/ggseg/reference/ggbrain.html)
and 3D vertex indices for
[`ggseg3d::ggseg3d()`](https://rdrr.io/pkg/ggseg3d/man/ggseg3d.html).

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
#> 
#> ── craddock200_cortical ggseg atlas ────────────────────────────────────────────
#> Type: cortical
#> Regions: 169
#> Hemispheres: left, right
#> Views: lateral, medial
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 191 × 3
#>     hemi  region     label        
#>     <chr> <chr>      <chr>        
#>   1 left  parcel 001 lh_Parcel_001
#>   2 left  parcel 002 lh_Parcel_002
#>   3 left  parcel 004 lh_Parcel_004
#>   4 left  parcel 005 lh_Parcel_005
#>   5 left  parcel 008 lh_Parcel_008
#>   6 left  parcel 011 lh_Parcel_011
#>   7 left  parcel 013 lh_Parcel_013
#>   8 left  parcel 016 lh_Parcel_016
#>   9 left  parcel 019 lh_Parcel_019
#>  10 left  parcel 020 lh_Parcel_020
#>  11 left  parcel 021 lh_Parcel_021
#>  12 left  parcel 022 lh_Parcel_022
#>  13 left  parcel 023 lh_Parcel_023
#>  14 left  parcel 024 lh_Parcel_024
#>  15 left  parcel 027 lh_Parcel_027
#>  16 left  parcel 029 lh_Parcel_029
#>  17 left  parcel 033 lh_Parcel_033
#>  18 left  parcel 034 lh_Parcel_034
#>  19 left  parcel 037 lh_Parcel_037
#>  20 left  parcel 040 lh_Parcel_040
#>  21 left  parcel 042 lh_Parcel_042
#>  22 left  parcel 043 lh_Parcel_043
#>  23 left  parcel 046 lh_Parcel_046
#>  24 left  parcel 050 lh_Parcel_050
#>  25 left  parcel 051 lh_Parcel_051
#>  26 left  parcel 054 lh_Parcel_054
#>  27 left  parcel 055 lh_Parcel_055
#>  28 left  parcel 056 lh_Parcel_056
#>  29 left  parcel 057 lh_Parcel_057
#>  30 left  parcel 058 lh_Parcel_058
#>  31 left  parcel 061 lh_Parcel_061
#>  32 left  parcel 063 lh_Parcel_063
#>  33 left  parcel 068 lh_Parcel_068
#>  34 left  parcel 070 lh_Parcel_070
#>  35 left  parcel 072 lh_Parcel_072
#>  36 left  parcel 073 lh_Parcel_073
#>  37 left  parcel 074 lh_Parcel_074
#>  38 left  parcel 076 lh_Parcel_076
#>  39 left  parcel 078 lh_Parcel_078
#>  40 left  parcel 079 lh_Parcel_079
#>  41 left  parcel 082 lh_Parcel_082
#>  42 left  parcel 088 lh_Parcel_088
#>  43 left  parcel 089 lh_Parcel_089
#>  44 left  parcel 090 lh_Parcel_090
#>  45 left  parcel 092 lh_Parcel_092
#>  46 left  parcel 095 lh_Parcel_095
#>  47 left  parcel 096 lh_Parcel_096
#>  48 left  parcel 097 lh_Parcel_097
#>  49 left  parcel 099 lh_Parcel_099
#>  50 left  parcel 101 lh_Parcel_101
#>  51 left  parcel 104 lh_Parcel_104
#>  52 left  parcel 108 lh_Parcel_108
#>  53 left  parcel 109 lh_Parcel_109
#>  54 left  parcel 111 lh_Parcel_111
#>  55 left  parcel 112 lh_Parcel_112
#>  56 left  parcel 114 lh_Parcel_114
#>  57 left  parcel 116 lh_Parcel_116
#>  58 left  parcel 117 lh_Parcel_117
#>  59 left  parcel 121 lh_Parcel_121
#>  60 left  parcel 122 lh_Parcel_122
#>  61 left  parcel 123 lh_Parcel_123
#>  62 left  parcel 125 lh_Parcel_125
#>  63 left  parcel 129 lh_Parcel_129
#>  64 left  parcel 130 lh_Parcel_130
#>  65 left  parcel 131 lh_Parcel_131
#>  66 left  parcel 133 lh_Parcel_133
#>  67 left  parcel 136 lh_Parcel_136
#>  68 left  parcel 141 lh_Parcel_141
#>  69 left  parcel 145 lh_Parcel_145
#>  70 left  parcel 146 lh_Parcel_146
#>  71 left  parcel 147 lh_Parcel_147
#>  72 left  parcel 148 lh_Parcel_148
#>  73 left  parcel 149 lh_Parcel_149
#>  74 left  parcel 150 lh_Parcel_150
#>  75 left  parcel 151 lh_Parcel_151
#>  76 left  parcel 154 lh_Parcel_154
#>  77 left  parcel 156 lh_Parcel_156
#>  78 left  parcel 158 lh_Parcel_158
#>  79 left  parcel 159 lh_Parcel_159
#>  80 left  parcel 160 lh_Parcel_160
#>  81 left  parcel 165 lh_Parcel_165
#>  82 left  parcel 167 lh_Parcel_167
#>  83 left  parcel 171 lh_Parcel_171
#>  84 left  parcel 173 lh_Parcel_173
#>  85 left  parcel 174 lh_Parcel_174
#>  86 left  parcel 177 lh_Parcel_177
#>  87 left  parcel 179 lh_Parcel_179
#>  88 left  parcel 182 lh_Parcel_182
#>  89 left  parcel 183 lh_Parcel_183
#>  90 left  parcel 184 lh_Parcel_184
#>  91 left  parcel 188 lh_Parcel_188
#>  92 left  parcel 189 lh_Parcel_189
#>  93 left  parcel 191 lh_Parcel_191
#>  94 left  parcel 195 lh_Parcel_195
#>  95 left  parcel 197 lh_Parcel_197
#>  96 left  parcel 199 lh_Parcel_199
#>  97 left  parcel 200 lh_Parcel_200
#>  98 right parcel 003 rh_Parcel_003
#>  99 right parcel 006 rh_Parcel_006
#> 100 right parcel 007 rh_Parcel_007
#> 101 right parcel 012 rh_Parcel_012
#> 102 right parcel 013 rh_Parcel_013
#> 103 right parcel 014 rh_Parcel_014
#> 104 right parcel 015 rh_Parcel_015
#> 105 right parcel 017 rh_Parcel_017
#> 106 right parcel 018 rh_Parcel_018
#> 107 right parcel 022 rh_Parcel_022
#> 108 right parcel 025 rh_Parcel_025
#> 109 right parcel 026 rh_Parcel_026
#> 110 right parcel 028 rh_Parcel_028
#> 111 right parcel 029 rh_Parcel_029
#> 112 right parcel 031 rh_Parcel_031
#> 113 right parcel 032 rh_Parcel_032
#> 114 right parcel 035 rh_Parcel_035
#> 115 right parcel 038 rh_Parcel_038
#> 116 right parcel 039 rh_Parcel_039
#> 117 right parcel 040 rh_Parcel_040
#> 118 right parcel 044 rh_Parcel_044
#> 119 right parcel 046 rh_Parcel_046
#> 120 right parcel 048 rh_Parcel_048
#> 121 right parcel 049 rh_Parcel_049
#> 122 right parcel 051 rh_Parcel_051
#> 123 right parcel 053 rh_Parcel_053
#> 124 right parcel 054 rh_Parcel_054
#> 125 right parcel 055 rh_Parcel_055
#> 126 right parcel 058 rh_Parcel_058
#> 127 right parcel 059 rh_Parcel_059
#> 128 right parcel 060 rh_Parcel_060
#> 129 right parcel 062 rh_Parcel_062
#> 130 right parcel 064 rh_Parcel_064
#> 131 right parcel 065 rh_Parcel_065
#> 132 right parcel 066 rh_Parcel_066
#> 133 right parcel 068 rh_Parcel_068
#> 134 right parcel 069 rh_Parcel_069
#> 135 right parcel 071 rh_Parcel_071
#> 136 right parcel 075 rh_Parcel_075
#> 137 right parcel 079 rh_Parcel_079
#> 138 right parcel 081 rh_Parcel_081
#> 139 right parcel 085 rh_Parcel_085
#> 140 right parcel 087 rh_Parcel_087
#> 141 right parcel 089 rh_Parcel_089
#> 142 right parcel 093 rh_Parcel_093
#> 143 right parcel 098 rh_Parcel_098
#> 144 right parcel 100 rh_Parcel_100
#> 145 right parcel 102 rh_Parcel_102
#> 146 right parcel 105 rh_Parcel_105
#> 147 right parcel 106 rh_Parcel_106
#> 148 right parcel 107 rh_Parcel_107
#> 149 right parcel 109 rh_Parcel_109
#> 150 right parcel 110 rh_Parcel_110
#> 151 right parcel 111 rh_Parcel_111
#> 152 right parcel 113 rh_Parcel_113
#> 153 right parcel 115 rh_Parcel_115
#> 154 right parcel 119 rh_Parcel_119
#> 155 right parcel 123 rh_Parcel_123
#> 156 right parcel 124 rh_Parcel_124
#> 157 right parcel 127 rh_Parcel_127
#> 158 right parcel 128 rh_Parcel_128
#> 159 right parcel 130 rh_Parcel_130
#> 160 right parcel 132 rh_Parcel_132
#> 161 right parcel 134 rh_Parcel_134
#> 162 right parcel 137 rh_Parcel_137
#> 163 right parcel 138 rh_Parcel_138
#> 164 right parcel 140 rh_Parcel_140
#> 165 right parcel 142 rh_Parcel_142
#> 166 right parcel 143 rh_Parcel_143
#> 167 right parcel 144 rh_Parcel_144
#> 168 right parcel 148 rh_Parcel_148
#> 169 right parcel 149 rh_Parcel_149
#> 170 right parcel 153 rh_Parcel_153
#> 171 right parcel 155 rh_Parcel_155
#> 172 right parcel 157 rh_Parcel_157
#> 173 right parcel 160 rh_Parcel_160
#> 174 right parcel 161 rh_Parcel_161
#> 175 right parcel 163 rh_Parcel_163
#> 176 right parcel 164 rh_Parcel_164
#> 177 right parcel 166 rh_Parcel_166
#> 178 right parcel 168 rh_Parcel_168
#> 179 right parcel 170 rh_Parcel_170
#> 180 right parcel 172 rh_Parcel_172
#> 181 right parcel 174 rh_Parcel_174
#> 182 right parcel 175 rh_Parcel_175
#> 183 right parcel 180 rh_Parcel_180
#> 184 right parcel 181 rh_Parcel_181
#> 185 right parcel 185 rh_Parcel_185
#> 186 right parcel 186 rh_Parcel_186
#> 187 right parcel 187 rh_Parcel_187
#> 188 right parcel 193 rh_Parcel_193
#> 189 right parcel 195 rh_Parcel_195
#> 190 right parcel 197 rh_Parcel_197
#> 191 right parcel 198 rh_Parcel_198
```
