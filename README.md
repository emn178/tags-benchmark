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
acts-as-taggable-on       36.377959   1.630785  38.008744 ( 55.704902)
acts-as-taggable-array-on  1.491484   0.084560   1.576044 (  2.432864)
---------------------------------
benchmark:list
                               user     system      total        real
acts-as-taggable-on        1.054643   0.040069   1.094712 (  1.711029)
acts-as-taggable-array-on  0.038070   0.001136   0.039206 (  0.048498)
---------------------------------
benchmark:ownership
                               user     system      total        real
acts-as-taggable-on        0.007535   0.000501   0.008036 (  0.063663)
acts-as-taggable-array-on  0.004541   0.000784   0.005325 (  0.015362)
---------------------------------
benchmark:find_by_tag
                               user     system      total        real
acts-as-taggable-on        0.060807   0.003917   0.064724 (  0.176698)
acts-as-taggable-array-on  0.004174   0.000279   0.004453 (  0.012251)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.045350   0.001312   0.046662 (  0.080520)
acts-as-taggable-array-on  0.010802   0.000532   0.011334 (  0.019221)
---------------------------------
```
