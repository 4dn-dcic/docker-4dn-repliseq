#!/bin/bash
# Runs dedup, produces a QC report in addition to the output files of the dedup script of the repli-seq pipeline.

INPUT=$1
OUTDIR=$2
OUTPREFIX=$3

dedup $1 $2 $3

BASE=$OUTDIR/$OUTPREFIX
QCBASE=${BASE}.rmdup.log.qc_report
LOGFILE=${BASE}.rmdup.bam.log
QC_SUMMARY_FILE=${QCBASE}/summary.txt

mkdir -p $QCBASE

perl -ne 'm#\[bam_rmdupse_core] (\d+) / (\d+) = ([\d\.]+) in library#; \
          print "Total aligned\t$2\nNumber of removed duplicates\t$1\nProportion of removed duplicates\t$3\n"' \
          $LOGFILE \
          > $QC_SUMMARY_FILE

zip $QCBASE.zip $QCBASE
