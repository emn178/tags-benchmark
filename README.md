# Tags Benchmark
Benchmark [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on) vs. [acts-as-taggable-array-on](https://github.com/tmiyamon/acts-as-taggable-array-on)

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
acts-as-taggable-on       33.000478   1.194249  34.194727 ( 46.103180)
acts-as-taggable-array-on  1.459505   0.085844   1.545349 (  2.164117)
pg_taggable                1.559289   0.089297   1.648586 (  2.242263)
---------------------------------
benchmark:list
                               user     system      total        real
acts-as-taggable-on        1.080749   0.036074   1.116823 (  1.780711)
acts-as-taggable-array-on  0.032466   0.000602   0.033068 (  0.038429)
pg_taggable                0.028307   0.000629   0.028936 (  0.034358)
---------------------------------
benchmark:ownership
                               user     system      total        real
acts-as-taggable-on        0.007209   0.000591   0.007800 (  0.032829)
acts-as-taggable-array-on  0.004210   0.000712   0.004922 (  0.014295)
pg_taggable                0.003516   0.000328   0.003844 (  0.010513)
---------------------------------
benchmark:find_by_tag
                               user     system      total        real
acts-as-taggable-on        0.047971   0.003356   0.051327 (  0.167504)
acts-as-taggable-array-on  0.036378   0.005092   0.041470 (  0.175794)
pg_taggable                0.041960   0.004089   0.046049 (  0.157058)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.041828   0.000888   0.042716 (  0.100854)
acts-as-taggable-array-on  0.008292   0.000557   0.008849 (  0.016802)
pg_taggable                0.007974   0.000391   0.008365 (  0.017809)
---------------------------------
```
