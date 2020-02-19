#!/bin/bash

# Run this script inside the directory that you want your overlap results

overlap_bed="/Volumes/shung/projects/gzl_targeted/comparison_to_WES/data/target_intersect_exome.bed"
calls_file="/Volumes/shung/projects/gzl_targeted/roc_analysis/data/calls.lowTC.txt"
gold_file="/Volumes/shung/projects/gzl_targeted/roc_analysis/data/gold.data.lowTC.txt"

echo "Filtering low TC calls for variants in exome+target bed"

# extract chr, pos and pos field to create a bed format from variants file
paste <(cut -f3,4 $calls_file) <(cut -f4 $calls_file) > calls.lowTC.bed | sort -u
paste <(cut -f3,4 $gold_file) <(cut -f4 $gold_file) > gold.lowTC.bed | sort -u

# now get the overlap between the two bed files
bedtools intersect -a calls.lowTC.bed -b $overlap_bed | sort -u > calls.lowTC.intersect_both_bait_sets.bed
bedtools intersect -a gold.lowTC.bed -b $overlap_bed | sort -u > gold.lowTC.intersect_both_bait_sets.bed

