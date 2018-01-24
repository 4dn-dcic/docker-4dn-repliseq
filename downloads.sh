#!/bin/sh

## SOFTWARE: repli-seq-pipeline
## COMMIT: f2eb460
## TYPE: aligner,filter,normalizer,smoother
## SOURCE_URL: https://github.com/4dn-dcic/repli-seq-pipeline
git clone https://github.com/4dn-dcic/repli-seq-pipeline
cd repli-seq-pipeline
git checkout f2eb460
rm -rf sample_data
chmod +x *
cd ..


## SOFTWARE: cutadapt
## VERSION: 1.14
## TYPE: adapter remover
## SOURCE_URL: https://github.com/marcelm/cutadapt
pip install cutadapt==1.14


## SOFTWARE: bwa
## VERSION: 0.7.15
## TYPE: aligner
## SOURCE_URL: https://github.com/lh3/bwa
wget https://github.com/lh3/bwa/archive/v0.7.15.tar.gz
tar -xzf v0.7.15.tar.gz
cd bwa-0.7.15
make
cd ..
ln -s bwa-0.7.15 bwa


## SOFTWARE: bedtools
## VERSION: 2.26.0
## TYPE: filter
## SOURCE_URL: https://github.com/arq5x/bedtools2
wget https://github.com/arq5x/bedtools2/releases/download/v2.26.0/bedtools-2.26.0.tar.gz
tar -zxvf bedtools-2.26.0.tar.gz
cd bedtools2
make
cd ..


## SOFTWARE: samtools
## VERSION: 1.4
## TYPE: file format converter
## SOURCE_URL: https://github.com/samtools/samtools
wget https://github.com/samtools/samtools/releases/download/1.4/samtools-1.4.tar.bz2
tar -xjf samtools-1.4.tar.bz2
cd samtools-1.4
make
cd ..
ln -s samtools-1.4 samtools


