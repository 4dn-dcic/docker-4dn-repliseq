#!/bin/bash
# Runs dedup, produces a QC report in addition to the output files of the dedup script of the repli-seq pipeline.
set -e

INPUT=$1
OUTDIR=$2
OUTPREFIX=$3

dedup $1 $2 $3

BASE=$OUTDIR/$OUTPREFIX
QCBASE=${BASE}.rmdup.log.qc_report
LOGFILE=${BASE}.rmdup.bam.log
QC_SUMMARY_FILE=${QCBASE}/summary.txt

mkdir -p $QCBASE

# total mapped reads, in case no duplicate reads were detected
TOT=`samtools view -F4 $INPUT  | wc -l`
echo -e "Total aligned\\t$TOT" > $QC_SUMMARY_FILE
perl -ne 'if(m#\[bam_rmdupse_core] (\d+) / (\d+) = ([\d\.]+) in library#){
            $rm=$1; $prm=$3; }
          else {
            $rm=0; $prm=0; }
          print "Number of removed duplicates\t$rm\nProportion of removed duplicates\t$prm\n"' \
          $LOGFILE \
          >> $QC_SUMMARY_FILE

zip -r $QCBASE.zip $QCBASE
