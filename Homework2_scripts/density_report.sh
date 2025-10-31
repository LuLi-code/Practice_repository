#!/bin/bash
# Classify chromosomes based on gene density

file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

echo -e "Chromosome\tGeneCount\tClass" > density_report.txt

chromosomes=($(grep -v "^#" "$file" | cut -f1 | sort | uniq))

for chr in "${chromosomes[@]}"; do
    count=$(awk -v c="$chr" '$1==c && $3=="gene"' "$file" | wc -l)
    
    # Classification using if/then
    if (( count > 2000 )); then
        class="High-density"
    else
        class="Low-density"
    fi
    
    echo -e "${chr}\t${count}\t${class}" >> density_report.txt
done

echo "✅ Density classification complete. Results saved to density_report.txt"

