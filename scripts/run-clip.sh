#!/bin/bash
shopt -s extglob
set -o pipefail
fastq2=
outdir=.
prefix=out

printHelpAndExit() {
    echo "Usage: ${0##*/} [-O outdir] [-o out_prefix] -1 fastq1 [-2 fastq2]"
    echo "-1 fastq1 : input file (R1) in fastq format"
    echo "-2 fastq2 : input file (R2) in fastq format"
    echo "-O outdir : default ."
    echo "-o out_prefix : default out"
    exit 1
}

while getopts "1:2:O:o:" opt; do
    case $opt in
        1) fastq1=$OPTARG;;
        2) fastq2=$OPTARG;;
        O) outdir=$OPTARG;;
        o) prefix=$OPTARG;;
        h) printHelpAndExit 0;;
        [?]) printHelpAndExit 1;;
        esac
done

if [[ -z $fastq1 || ! -e $fastq1 ]]
then
  echo "fastq1 file missing"
  exit 1
fi

if [[ $outdir != '.' ]]
then
  cd $outdir
fi

# run clip
clip $fastq1 . $prefix.R1 || exit
if [[ ! -z $fastq2 ]]
then
  clip $fastq2 . $prefix.R2 || exit
fi
