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
Calculating -------------------------------------
 acts-as-taggable-on      0.021 (± 0.0%) i/s    (47.50 s/i) -      1.000 in  47.499407s
acts-as-taggable-array-on
                          0.487 (± 0.0%) i/s     (2.05 s/i) -      3.000 in   6.161091s
         pg_taggable      0.484 (± 0.0%) i/s     (2.07 s/i) -      3.000 in   6.197196s
---------------------------------
benchmark:as_json
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      0.055 (± 0.0%) i/s    (18.21 s/i) -      1.000 in  18.208944s
acts-as-taggable-array-on
                          0.983 (± 0.0%) i/s     (1.02 s/i) -      6.000 in   6.152531s
         pg_taggable      1.034 (± 0.0%) i/s  (967.47 ms/i) -      6.000 in   5.809804s
---------------------------------
benchmark:owned_tags
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      2.471 (±40.5%) i/s  (404.74 ms/i) -     12.000 in   5.234341s
acts-as-taggable-array-on
                          3.249 (± 0.0%) i/s  (307.82 ms/i) -     16.000 in   5.031208s
         pg_taggable      3.323 (± 0.0%) i/s  (300.89 ms/i) -     17.000 in   5.165599s
---------------------------------
benchmark:count
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      1.070 (± 0.0%) i/s  (934.87 ms/i) -      6.000 in   5.621106s
acts-as-taggable-array-on
                          3.061 (± 0.0%) i/s  (326.66 ms/i) -     16.000 in   5.250155s
         pg_taggable      3.273 (± 0.0%) i/s  (305.55 ms/i) -     17.000 in   5.215984s
---------------------------------
benchmark:like
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      6.360 (±78.6%) i/s  (157.22 ms/i) -     26.000 in   5.050598s
acts-as-taggable-array-on
                          0.807 (± 0.0%) i/s     (1.24 s/i) -      5.000 in   6.217276s
         pg_taggable      0.928 (± 0.0%) i/s     (1.08 s/i) -      5.000 in   5.392569s
---------------------------------
benchmark:all_tags[1]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      4.025 (±24.8%) i/s  (248.46 ms/i) -     20.000 in   5.054010s
acts-as-taggable-array-on
                         10.377 (±19.3%) i/s   (96.37 ms/i) -     50.000 in   5.070872s
         pg_taggable     10.658 (±18.8%) i/s   (93.83 ms/i) -     51.000 in   5.045711s
---------------------------------
benchmark:all_tags[5]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      0.463 (± 0.0%) i/s     (2.16 s/i) -      3.000 in   6.480544s
acts-as-taggable-array-on
                         15.917 (±50.3%) i/s   (62.83 ms/i) -     66.000 in   5.082511s
         pg_taggable     11.104 (±27.0%) i/s   (90.06 ms/i) -     52.000 in   5.009450s
---------------------------------
benchmark:all_tags[10]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         2.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      0.117 (± 0.0%) i/s     (8.53 s/i) -      1.000 in   8.533582s
acts-as-taggable-array-on
                         17.848 (±50.4%) i/s   (56.03 ms/i) -     76.000 in   5.207719s
         pg_taggable     11.504 (±17.4%) i/s   (86.93 ms/i) -     56.000 in   5.007423s
---------------------------------
benchmark:any_tags[1]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      3.362 (± 0.0%) i/s  (297.47 ms/i) -     17.000 in   5.135870s
acts-as-taggable-array-on
                          5.745 (±17.4%) i/s  (174.05 ms/i) -     28.000 in   5.024439s
         pg_taggable      6.228 (±32.1%) i/s  (160.56 ms/i) -     30.000 in   5.149333s
---------------------------------
benchmark:any_tags[5]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      2.637 (±37.9%) i/s  (379.24 ms/i) -     13.000 in   5.161145s
acts-as-taggable-array-on
                          1.807 (± 0.0%) i/s  (553.50 ms/i) -     10.000 in   5.558059s
         pg_taggable      1.851 (± 0.0%) i/s  (540.14 ms/i) -     10.000 in   5.467386s
---------------------------------
benchmark:any_tags[10]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      2.171 (±46.1%) i/s  (460.58 ms/i) -     11.000 in   5.311140s
acts-as-taggable-array-on
                          1.490 (± 0.0%) i/s  (671.32 ms/i) -      8.000 in   5.378806s
         pg_taggable      1.509 (± 0.0%) i/s  (662.76 ms/i) -      8.000 in   5.308514s
---------------------------------
benchmark:exclude_tags[1]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      2.572 (± 0.0%) i/s  (388.73 ms/i) -     13.000 in   5.167899s
acts-as-taggable-array-on
                          1.269 (± 0.0%) i/s  (787.84 ms/i) -      7.000 in   5.544178s
         pg_taggable      1.323 (± 0.0%) i/s  (755.66 ms/i) -      7.000 in   5.306183s
---------------------------------
benchmark:exclude_tags[5]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      2.077 (± 0.0%) i/s  (481.49 ms/i) -     11.000 in   5.325972s
acts-as-taggable-array-on
                          1.112 (± 0.0%) i/s  (899.34 ms/i) -      6.000 in   5.440142s
         pg_taggable      1.171 (± 0.0%) i/s  (854.11 ms/i) -      6.000 in   5.129889s
---------------------------------
benchmark:exclude_tags[10]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
acts-as-taggable-array-on
                         1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      1.956 (±51.1%) i/s  (511.35 ms/i) -     10.000 in   5.371704s
acts-as-taggable-array-on
                          0.998 (± 0.0%) i/s     (1.00 s/i) -      5.000 in   5.023394s
         pg_taggable      1.014 (± 0.0%) i/s  (985.74 ms/i) -      6.000 in   5.918865s
---------------------------------
benchmark:match_all_tags[1]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      1.495 (± 0.0%) i/s  (668.81 ms/i) -      8.000 in   5.379761s
         pg_taggable      7.993 (±37.5%) i/s  (125.11 ms/i) -     37.000 in   5.061658s
---------------------------------
benchmark:match_all_tags[5]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
         pg_taggable     2.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      0.396 (± 0.0%) i/s     (2.53 s/i) -      2.000 in   5.051440s
         pg_taggable     17.332 (±69.2%) i/s   (57.70 ms/i) -     54.000 in   5.137717s
---------------------------------
benchmark:match_all_tags[10]
ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [arm64-darwin22]
Warming up --------------------------------------
 acts-as-taggable-on     1.000 i/100ms
         pg_taggable     1.000 i/100ms
Calculating -------------------------------------
 acts-as-taggable-on      0.112 (± 0.0%) i/s     (8.90 s/i) -      1.000 in   8.897128s
         pg_taggable     14.906 (±73.8%) i/s   (67.09 ms/i) -     48.000 in   5.091181s
---------------------------------
```
