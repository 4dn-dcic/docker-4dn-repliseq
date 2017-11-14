#!/bin/bash

fastq1=$1
index_file=$2
outdir=$3
prefix=$4
nThreads=$5

if [[ $outdir != '.' ]]
then
  cd $outdir
fi

# unzip index
tar -xzf $index_file
index=`ls -1 *.bwt | head -1 | sed 's/\.bwt//g'`

# unzip fastq files
if [[ $fastq1 =~ \.gz$ ]]
then
  cp $fastq1 fastq1.gz
  gunzip fastq1.gz
else
  cp $fastq1 fastq1
fi
  fastq1=fastq1

# run bwa
align_se $fastq1 $index . $prefix $nThreads

