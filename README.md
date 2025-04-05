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
acts-as-taggable-on       35.433157   1.191576  36.624733 ( 49.648901)
acts-as-taggable-array-on  1.402737   0.077966   1.480703 (  2.069872)
pg_taggable                1.381906   0.078490   1.460396 (  2.036587)
---------------------------------
benchmark:as_json
                               user     system      total        real
acts-as-taggable-on        1.036777   0.031904   1.068681 (  1.709097)
acts-as-taggable-array-on  0.038740   0.000483   0.039223 (  0.044153)
pg_taggable                0.036713   0.000499   0.037212 (  0.040892)
---------------------------------
benchmark:owned_tags
                               user     system      total        real
acts-as-taggable-on        0.008136   0.000463   0.008599 (  0.023463)
acts-as-taggable-array-on  0.004122   0.000623   0.004745 (  0.011017)
pg_taggable                0.004025   0.000237   0.004262 (  0.010159)
---------------------------------
benchmark:count
                               user     system      total        real
acts-as-taggable-on        0.034503   0.000513   0.035016 (  0.073746)
acts-as-taggable-array-on  0.006224   0.000277   0.006501 (  0.013319)
pg_taggable                0.005457   0.000404   0.005861 (  0.014478)
---------------------------------
benchmark:all_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.075741   0.005648   0.081389 (  0.202451)
acts-as-taggable-array-on  0.121663   0.009360   0.131023 (  0.240641)
pg_taggable                0.144310   0.010992   0.155302 (  0.283593)
---------------------------------
benchmark:all_tags[2]
                               user     system      total        real
acts-as-taggable-on        0.180271   0.014934   0.195205 (  0.587904)
acts-as-taggable-array-on  0.107487   0.009037   0.116524 (  0.233828)
pg_taggable                0.051109   0.004087   0.055196 (  0.159096)
---------------------------------
benchmark:all_tags[3]
                               user     system      total        real
acts-as-taggable-on        0.176246   0.011936   0.188182 (  0.669595)
acts-as-taggable-array-on  0.055966   0.003250   0.059216 (  0.123845)
pg_taggable                0.082834   0.006349   0.089183 (  0.174458)
---------------------------------
benchmark:all_tags[4]
                               user     system      total        real
acts-as-taggable-on        0.265666   0.016700   0.282366 (  1.568367)
acts-as-taggable-array-on  0.074388   0.008579   0.082967 (  0.116381)
pg_taggable                0.048113   0.004170   0.052283 (  0.089600)
---------------------------------
benchmark:all_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.217039   0.014126   0.231165 (  2.073421)
acts-as-taggable-array-on  0.085242   0.011033   0.096275 (  0.139638)
pg_taggable                0.059814   0.005301   0.065115 (  0.127625)
---------------------------------
benchmark:any_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.111405   0.007523   0.118928 (  0.211404)
acts-as-taggable-array-on  0.052191   0.005524   0.057715 (  0.127168)
pg_taggable                0.086301   0.007361   0.093662 (  0.205054)
---------------------------------
benchmark:any_tags[2]
                               user     system      total        real
acts-as-taggable-on        0.123055   0.007818   0.130873 (  0.268391)
acts-as-taggable-array-on  0.095919   0.007539   0.103458 (  0.213943)
pg_taggable                0.072219   0.005697   0.077916 (  0.178270)
---------------------------------
benchmark:any_tags[3]
                               user     system      total        real
acts-as-taggable-on        0.136196   0.008895   0.145091 (  0.285450)
acts-as-taggable-array-on  0.128090   0.013648   0.141738 (  0.337576)
pg_taggable                0.108044   0.010419   0.118463 (  0.271169)
---------------------------------
benchmark:any_tags[4]
                               user     system      total        real
acts-as-taggable-on        0.141235   0.008715   0.149950 (  0.299848)
acts-as-taggable-array-on  0.088969   0.008542   0.097511 (  0.325581)
pg_taggable                0.074829   0.006588   0.081417 (  0.407368)
---------------------------------
benchmark:any_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.168670   0.012851   0.181521 (  0.399285)
acts-as-taggable-array-on  0.112355   0.011075   0.123430 (  0.342948)
pg_taggable                0.117660   0.010622   0.128282 (  0.357843)
---------------------------------
benchmark:exclude_tags[1]
                               user     system      total        real
acts-as-taggable-on        0.210295   0.013061   0.223356 (  0.332404)
acts-as-taggable-array-on  0.196007   0.015350   0.211357 (  0.345675)
pg_taggable                0.163370   0.014547   0.177917 (  0.279329)
---------------------------------
benchmark:exclude_tags[2]
                               user     system      total        real
acts-as-taggable-on        0.168334   0.011229   0.179563 (  0.275234)
acts-as-taggable-array-on  0.182780   0.013594   0.196374 (  0.336652)
pg_taggable                0.241640   0.018018   0.259658 (  0.444534)
---------------------------------
benchmark:exclude_tags[3]
                               user     system      total        real
acts-as-taggable-on        0.256388   0.016460   0.272848 (  0.434698)
acts-as-taggable-array-on  0.226745   0.017076   0.243821 (  0.468280)
pg_taggable                0.224022   0.013870   0.237892 (  0.466795)
---------------------------------
benchmark:exclude_tags[4]
                               user     system      total        real
acts-as-taggable-on        0.272111   0.016324   0.288435 (  0.473255)
acts-as-taggable-array-on  0.219686   0.013002   0.232688 (  0.487169)
pg_taggable                0.220406   0.017502   0.237908 (  0.502753)
---------------------------------
benchmark:exclude_tags[5]
                               user     system      total        real
acts-as-taggable-on        0.291632   0.018941   0.310573 (  0.515316)
acts-as-taggable-array-on  0.247739   0.018183   0.265922 (  0.599784)
pg_taggable                0.231276   0.016538   0.247814 (  0.585948)
---------------------------------
benchmark:match_all_tags[10]
                         user     system      total        real
acts-as-taggable-on  0.652204   0.034275   0.686479 (  8.935679)
pg_taggable          0.106071   0.008844   0.114915 (  0.159460)
---------------------------------
```
