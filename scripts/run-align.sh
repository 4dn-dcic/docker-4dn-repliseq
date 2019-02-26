#!/bin/bash
shopt -s extglob
set -o pipefail
fastq2=
outdir=.
prefix=out
nThreads=1

printHelpAndExit() {
    echo "Usage: ${0##*/} [-p ncores] [-O outdir] [-o out_prefix] -1 fastq1 -2 fastq2 -I index"
    echo "-1 fastq1 : input file (R1) in fastq format"
    echo "-2 fastq2 : input file (R2) in fastq format"
    echo "-I index : bwa index in tgz"
    echo "-O outdir : default ."
    echo "-o out_prefix : default out"
    echo "-p ncores : default 1"
    exit 1
}

while getopts "1:2:I:O:o:p:" opt; do
    case $opt in
        1) fastq1=$OPTARG;;
        2) fastq2=$OPTARG;;
        I) index_file=$OPTARG;;
        p) nThreads=$OPTARG;;
        O) outdir=$OPTARG;;
        o) prefix=$OPTARG;;
        h) printHelpAndExit 0;;
        [?]) printHelpAndExit 1;;
        esac
done

if [[ ! -z $index_file ]]
then
  echo "index file missing"
  exit 1
fi

if [[ ! -z $fastq1 ]]
then
  echo "fastq1 file missing"
  exit 1
fi

if [[ $outdir != '.' ]]
then
  cd $outdir
fi

# unzip index
tar -xzf $index_file
index=`ls -1 *.bwt | head -1 | sed 's/\.bwt//g'`

# unzip fastq file 1
if [[ $fastq1 =~ \.gz$ ]]
then
  cp $fastq1 fastq1.gz
  gunzip fastq1.gz
else
  cp $fastq1 fastq1
fi
  fastq1=fastq1
  
# unzip fastq file 2
if [[  ! -z $fastq2 && $fastq2 =~ \.gz$ ]]
then
  cp $fastq2 fastq2.gz
  gunzip fastq2.gz
else
  cp $fastq2 fastq2
fi
  fastq2=fastq2
  

# run bwa
if [[ -z $fastq2 ]]
then
  align $fastq1 $index . $prefix $nThreads || exit
else
  align_pe $fastq1 $fastq2 $index . $prefix $nThreads || exit
fi

