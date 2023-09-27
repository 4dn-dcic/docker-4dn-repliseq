#!/bin/bash
# Runs count, convert the output bedgraph into a bigwig file. The bedgraph file is also pairix-indexed
set -e

INPUT=$1
CHROMSIZE=$2
OUTDIR=$3
OUTPREFIX=$4
WINSIZE=$5

count $1 $2 $3 $4 $5
gunzip $OUTDIR/$OUTPREFIX.w$WINSIZE.bedGraph.gz 
bedGraphToBigWig $OUTDIR/$OUTPREFIX.w$WINSIZE.bedGraph $CHROMSIZE $OUTDIR/$OUTPREFIX.w$WINSIZE.bw
bgzip $OUTDIR/$OUTPREFIX.w$WINSIZE.bedGraph
pairix -p bed $OUTDIR/$OUTPREFIX.w$WINSIZE.bedGraph.gz
gunzip $OUTDIR/$OUTPREFIX.w$WINSIZE.rpkm.bedGraph.gz 
bedGraphToBigWig $OUTDIR/$OUTPREFIX.w$WINSIZE.rpkm.bedGraph $CHROMSIZE $OUTDIR/$OUTPREFIX.w$WINSIZE.scaled.bw
bgzip $OUTDIR/$OUTPREFIX.w$WINSIZE.rpkm.bedGraph
pairix -p bed $OUTDIR/$OUTPREFIX.w$WINSIZE.rpkm.bedGraph.gz
