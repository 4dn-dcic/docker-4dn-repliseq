### v16
* chromosome order inconsistency between genome index and chromsize handling.

### v15
* (non-interleaved) PE support

### v14
* Updated `repliseq-pipeline` : The `count` script (used by `run-count.sh`) now sorts the binfile before feeding to `bedtools coverage` to avoid a sorting inconsistency issue.

### v13.1
* CWL `v1.0` is used instead of `draft-3`.

### v13
* `run-count.sh` is added to generate bigwig file as well (docker now includes kentUtils for bedGraphToBigWig)

### v12
* bgzip is included to create gzipped bedgraph files.
* cwl is included in the repo.
* run-dedup.sh errors fixed

### v8
* minor fixes in repli-seq pipeline script

### v7
* minor changes in repli-seq pipeline script arguments

### v6
* added run-align-se and run-align-pe

### v5
* the other steps updated (count, dedup, filter, filtersort, log2ratio, samstats)

### v4
* align module updated/simplified to align_pe and align_se

### v3
* clip script updated

### v2
* Using Denial Vera's pipeline forked by 4dn-dcic

### v1
* Initial draft.
