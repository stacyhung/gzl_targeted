#!/bin/bash

# Run this script inside the directory that you want your overlap results

overlap_bed="/Volumes/shung/projects/gzl_targeted/comparison_to_WES/data/target_intersect_exome.bed"
calls_file="/Volumes/shung/projects/gzl_targeted/comparison_to_WES/calls-WES_vs_targeted.txt"

echo "Filtering union calls for variants in exome+target bed"

# extract chr, pos and pos field to create a bed format from variants file
paste <(cut -f3,4 $calls_file) <(cut -f4 $calls_file) > calls.target_v_WES.union.bed | sort -u

# now get the overlap between the two bed files
bedtools intersect -a calls.target_v_WES.union.bed -b $overlap_bed | sort -u > calls.target_v_WES.union.intersect_both_bait_sets.bed

