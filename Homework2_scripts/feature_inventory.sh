#!/bin/bash
# Purpose: Count total features and feature types (gene, mRNA, exon) in a GFF file

echo "===== Starting feature_inventory.sh ====="

# A. Store input file name
file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"
echo "Input file set to: $file"

# B. Count total features 
echo "Counting total number of features..."
total=$(grep -v "^#" "$file" | wc -l)

# C. Count specific feature types
echo "Counting genes, mRNAs, and exons..."
gene=$(grep -v "^#" "$file" | cut -f3 | grep -w "gene" | wc -l)
mrna=$(grep -v "^#" "$file" | cut -f3 | grep -w "mRNA" | wc -l)
exon=$(grep -v "^#" "$file" | cut -f3 | grep -w "exon" | wc -l)

# D. Print results
echo "===== Feature Inventory Report ====="
echo -e "Total number of features: $total"
echo -e "gene:\t$gene"
echo -e "mRNA:\t$mrna"
echo -e "exon:\t$exon"
echo "===== Completed feature_inventory.sh ====="

