#!/bin/sh

## SOFTWARE: fastqc
## VERSION: 0.11.5
#wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
#unzip fastqc_v0.11.5.zip
#cd FastQC/
#chmod 755 fastqc
#cd ..


## SOFTWARE: repli-seq-pipeline
## COMMIT: be801aa
git clone https://github.com/4dn-dcic/repli-seq-pipeline
cd repli-seq-pipeline
git checkout be801aa
cd ..


## SOFTWARE: bowtie2
## VERSION: bowtie2-2.3.3.1
wget -O bowtie2-2.3.3.1-source.zip https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.3.1/bowtie2-2.3.3.1-source.zip/download 
unzip bowtie2-2.3.3.1-source.zip
cd bowtie2-2.3.3.1
make
cd ..
ln -s bowtie2-2.3.3.1 bowtie2


## SOFTWRAE: bedtools
## VERSION: 2.25.0
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -zxvf bedtools-2.25.0.tar.gz
cd bedtools2
make
cd ..


## SOFTWARE: samtools
## VERSION: 1.2
wget https://github.com/samtools/samtools/releases/download/1.2/samtools-1.2.tar.bz2
tar -xjf samtools-1.2.tar.bz2
cd samtools-1.2
make
cd ..
ln -s samtools-1.2 samtools


