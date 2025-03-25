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
acts-as-taggable-on      479.195967  17.116110 496.312077 (680.653376)
acts-as-taggable-array-on 13.505276   0.759835  14.265111 ( 20.146004)
---------------------------------
benchmark:list
                               user     system      total        real
acts-as-taggable-on       15.736787   0.451188  16.187975 ( 25.836636)
acts-as-taggable-array-on  0.394650   0.006578   0.401228 (  0.459344)
---------------------------------
benchmark:ownership
                               user     system      total        real
acts-as-taggable-on        0.165684   0.010729   0.176413 (  0.398549)
acts-as-taggable-array-on  0.151592   0.012290   0.163882 (  0.268699)
---------------------------------
benchmark:find_by_tag
                               user     system      total        real
acts-as-taggable-on        1.560049   0.120401   1.680450 (  3.492485)
acts-as-taggable-array-on  0.114764   0.012967   0.127731 (  0.565179)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.466517   0.008712   0.475229 (  0.699593)
acts-as-taggable-array-on  0.164903   0.008948   0.173851 (  0.281838)
---------------------------------
```
