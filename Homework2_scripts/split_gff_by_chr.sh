#!/bin/bash

echo "===== Starting split_gff_by_chr.sh ====="

file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"
echo "Input file set to: $file"

mkdir -p split_files
cd split_files

# List chromosome IDs
grep -v "^#" "$file" | cut -f1 | sort | uniq > chr_list.txt
total_chr=$(wc -l < chr_list.txt)
echo "Found $total_chr chromosomes."

# Write all features for each chromosome
while read chr
do
    echo "Writing data for $chr ..."
    grep "$chr" "$file" > "${chr}.gff"
    echo "Wrote ${chr}.gff"
done < chr_list.txt

file_count=$(ls *.gff | wc -l)
echo "Created $file_count .gff files."
echo "===== Completed split_gff_by_chr.sh ====="

