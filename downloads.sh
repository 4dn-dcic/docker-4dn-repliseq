#!/bin/sh

## SOFTWARE: repli-seq-pipeline
## COMMIT: 74bb1d6
## TYPE: aligner,filter,normalizer,smoother
## SOURCE_URL: https://github.com/4dn-dcic/repli-seq-pipeline
git clone https://github.com/4dn-dcic/repli-seq-pipeline
cd repli-seq-pipeline
git checkout 74bb1d6
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


## SOFTWARE: pairix
## VERSION: 0.3.5
## TYPE: file format converter,indexer
## SOURCE_URL: https://github.com/4dn-dcic/pairix
wget https://github.com/4dn-dcic/pairix/archive/0.3.5.tar.gz
tar -xzf 0.3.5.tar.gz
rm 0.3.5.tar.gz
cd pairix-0.3.5
make
cd ..
ln -s pairix-0.3.5 pairix


## SOFTWARE: bedGraphToBigWig
## VERSION: v302.1.0
## TYPE: file format converter
## SOURCE_URL: https://github.com/ENCODE-DCC/kentUtils
git clone https://github.com/ENCODE-DCC/kentUtils
cd kentUtils/
git checkout v302.1.0
make
cd ..

