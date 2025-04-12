# Tags Benchmark
Benchmark [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on) vs. [acts-as-taggable-array-on](https://github.com/tmiyamon/acts-as-taggable-array-on) vs.[pg_taggable](https://github.com/emn178/pg_taggable)

Prepare
```Bash
bundle
rake db:setup
```

Run benchmark
```Bash
rake benchmark:all
```

Reulst
```
---------------------------------
benchmark:create
                               user     system      total        real
acts-as-taggable-on       40.963988   1.298710  42.262698 ( 56.992226)
acts-as-taggable-array-on  1.403929   0.074533   1.478462 (  2.083619)
pg_taggable                1.357133   0.074155   1.431288 (  2.032347)
---------------------------------
benchmark:as_json
                               user     system      total        real
acts-as-taggable-on       12.737727   0.318587  13.056314 ( 20.257215)
acts-as-taggable-array-on  0.307478   0.003881   0.311359 (  0.365101)
pg_taggable                0.284679   0.003040   0.287719 (  0.343192)
---------------------------------
benchmark:owned_tags
                               user     system      total        real
acts-as-taggable-on        0.089809   0.004829   0.094638 (  0.266690)
acts-as-taggable-array-on  0.081134   0.006111   0.087245 (  0.148692)
pg_taggable                0.135113   0.009174   0.144287 (  0.212106)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.572744   0.015377   0.588121 (  1.092777)
acts-as-taggable-array-on  0.175338   0.009891   0.185229 (  0.257914)
pg_taggable                0.238737   0.015197   0.253934 (  0.358939)
---------------------------------
benchmark:like
                               user     system      total        real
acts-as-taggable-on        0.123937   0.010151   0.134088 (  0.217998)
acts-as-taggable-array-on  0.293873   0.026018   0.319891 (  1.102144)
pg_taggable                0.286407   0.027721   0.314128 (  0.970586)
---------------------------------
benchmark:all_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.128853   0.011676   0.140529 (  0.243973)
acts-as-taggable-array-on  0.123164   0.012448   0.135612 (  0.256541)
pg_taggable                0.116663   0.011023   0.127686 (  0.236638)
---------------------------------
benchmark:all_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.284875   0.018134   0.303009 (  2.185155)
acts-as-taggable-array-on  0.088756   0.008571   0.097327 (  0.141222)
pg_taggable                0.097159   0.008384   0.105543 (  0.178176)
---------------------------------
benchmark:all_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.378244   0.022629   0.400873 (  8.222911)
acts-as-taggable-array-on  0.098226   0.008733   0.106959 (  0.151894)
pg_taggable                0.084523   0.007540   0.092063 (  0.152397)
---------------------------------
benchmark:any_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.141352   0.011966   0.153318 (  0.287421)
acts-as-taggable-array-on  0.105753   0.009101   0.114854 (  0.216395)
pg_taggable                0.112071   0.009945   0.122016 (  0.223706)
---------------------------------
benchmark:any_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.170895   0.013447   0.184342 (  0.359673)
acts-as-taggable-array-on  0.117991   0.011452   0.129443 (  0.364825)
pg_taggable                0.102625   0.010942   0.113567 (  0.373789)
---------------------------------
benchmark:any_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.197124   0.015155   0.212279 (  0.460371)
acts-as-taggable-array-on  0.143779   0.014971   0.158750 (  0.541132)
pg_taggable                0.128871   0.010992   0.139863 (  0.529083)
---------------------------------
benchmark:exclude_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.219814   0.014500   0.234314 (  0.353267)
acts-as-taggable-array-on  0.208377   0.013628   0.222005 (  0.343637)
pg_taggable                0.210710   0.013570   0.224280 (  0.346687)
---------------------------------
benchmark:exclude_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.257994   0.017767   0.275761 (  0.462347)
acts-as-taggable-array-on  0.196397   0.014151   0.210548 (  0.510689)
pg_taggable                0.218428   0.014919   0.233347 (  0.495936)
---------------------------------
benchmark:exclude_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.252473   0.016691   0.269164 (  0.544026)
acts-as-taggable-array-on  0.202115   0.014272   0.216387 (  0.631815)
pg_taggable                0.208840   0.015315   0.224155 (  0.616589)
---------------------------------
benchmark:match_all_tags[1]
                         user     system      total        real
acts-as-taggable-on  0.261053   0.020093   0.281146 (  0.568867)
pg_taggable          0.107864   0.009732   0.117596 (  0.143162)
---------------------------------
benchmark:match_all_tags[5]
                         user     system      total        real
acts-as-taggable-on  0.397044   0.030256   0.427300 (  2.482363)
pg_taggable          0.090574   0.007899   0.098473 (  0.138950)
---------------------------------
benchmark:match_all_tags[10]
                         user     system      total        real
acts-as-taggable-on  0.538120   0.037460   0.575580 (  8.872828)
pg_taggable          0.097312   0.008873   0.106185 (  0.157570)
---------------------------------
```
