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
acts-as-taggable-on       33.855437   1.225139  35.080576 ( 49.455443)
acts-as-taggable-array-on  1.417779   0.080065   1.497844 (  2.073851)
pg_taggable                1.343623   0.077791   1.421414 (  2.013509)
---------------------------------
benchmark:as_json
                               user     system      total        real
acts-as-taggable-on        0.991429   0.032390   1.023819 (  1.611280)
acts-as-taggable-array-on  0.035955   0.000646   0.036601 (  0.040928)
pg_taggable                0.033192   0.000733   0.033925 (  0.038938)
---------------------------------
benchmark:owned_tags
                               user     system      total        real
acts-as-taggable-on        0.006767   0.000550   0.007317 (  0.023832)
acts-as-taggable-array-on  0.003623   0.000757   0.004380 (  0.014022)
pg_taggable                0.004755   0.000265   0.005020 (  0.014066)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.024792   0.000553   0.025345 (  0.064628)
acts-as-taggable-array-on  0.004844   0.000232   0.005076 (  0.015635)
pg_taggable                0.004635   0.000239   0.004874 (  0.010268)
---------------------------------
benchmark:all_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.069997   0.004908   0.074905 (  0.191956)
acts-as-taggable-array-on  0.078273   0.008294   0.086567 (  0.250715)
pg_taggable                0.043202   0.003783   0.046985 (  0.146077)
---------------------------------
benchmark:all_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.256987   0.017747   0.274734 (  2.261501)
acts-as-taggable-array-on  0.089847   0.006904   0.096751 (  0.128196)
pg_taggable                0.078100   0.006931   0.085031 (  0.144203)
---------------------------------
benchmark:all_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.371213   0.024987   0.396200 (  8.605681)
acts-as-taggable-array-on  0.062591   0.009337   0.071928 (  0.131142)
pg_taggable                0.032614   0.004331   0.036945 (  0.082447)
---------------------------------
benchmark:any_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.040465   0.002928   0.043393 (  0.102615)
acts-as-taggable-array-on  0.033137   0.002705   0.035842 (  0.086447)
pg_taggable                0.044052   0.002658   0.046710 (  0.098416)
---------------------------------
benchmark:any_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.157235   0.011267   0.168502 (  0.351121)
acts-as-taggable-array-on  0.121348   0.009657   0.131005 (  0.410099)
pg_taggable                0.138344   0.012935   0.151279 (  0.439179)
---------------------------------
benchmark:any_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.227232   0.013074   0.240306 (  0.548279)
acts-as-taggable-array-on  0.144562   0.011330   0.155892 (  0.518311)
pg_taggable                0.119617   0.009243   0.128860 (  0.501143)
---------------------------------
benchmark:exclude_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.257202   0.016709   0.273911 (  0.405729)
acts-as-taggable-array-on  0.208025   0.013759   0.221784 (  0.342241)
pg_taggable                0.195157   0.011135   0.206292 (  0.326040)
---------------------------------
benchmark:exclude_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.267335   0.017591   0.284926 (  0.465332)
acts-as-taggable-array-on  0.222403   0.013916   0.236319 (  0.547549)
pg_taggable                0.247296   0.019012   0.266308 (  0.585956)
---------------------------------
benchmark:exclude_tags[10]
                               user     system      total        real
acts-as-taggable-on        0.243406   0.014972   0.258378 (  0.479297)
acts-as-taggable-array-on  0.196653   0.013426   0.210079 (  0.632033)
pg_taggable                0.212517   0.014014   0.226531 (  0.695184)
---------------------------------
benchmark:match_all_tags[1]
                         user     system      total        real
acts-as-taggable-on  0.291958   0.022032   0.313990 (  0.644385)
pg_taggable          0.116826   0.010729   0.127555 (  0.155189)
---------------------------------
benchmark:match_all_tags[5]
                         user     system      total        real
acts-as-taggable-on  0.442355   0.026436   0.468791 (  2.460793)
pg_taggable          0.105279   0.007942   0.113221 (  0.148673)
---------------------------------
benchmark:match_all_tags[10]
                         user     system      total        real
acts-as-taggable-on  0.595025   0.032726   0.627751 (  8.866894)
pg_taggable          0.084190   0.009746   0.093936 (  0.136463)
---------------------------------
```
