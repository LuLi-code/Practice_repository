#!/bin/bash

echo "===== Starting genes_per_chromosome.sh ====="

file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"
echo "Input file set to: $file"

# Make list of chromosome IDs (ignore header lines)
grep -v "^#" "$file" | cut -f1 | sort | uniq > chr_list.txt
echo "Chromosome list saved to chr_list.txt"

echo -e "Chromosome\tGeneCount"

# Loop through chromosome list
while read chr
do
    echo "Processing $chr ..."
    # Count any line belonging to this chromosome that contains 'gene='
    count=$(grep -v "^#" "$file" | grep "^${chr}[[:space:]]" | grep "gene=" | wc -l)
    echo -e "${chr}\t${count}"
    echo "Finished counting genes for $chr."
done < chr_list.txt

echo "===== Completed genes_per_chromosome.sh ====="

