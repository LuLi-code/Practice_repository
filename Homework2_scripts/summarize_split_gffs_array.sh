#!/bin/bash

echo "===== Starting summarize_split_gffs_array.sh ====="

# Define array of features
features=("gene" "mRNA" "exon")

# Output file
output="chromosome_summary.txt"
echo -e "Chromosome\tgene\tmRNA\texon" > "$output"
echo "Output file created: $output"

# Loop through every .gff file in current folder
for file in *.gff
do
    echo "Processing $file ..."
    line="$file"
    # For each feature type, count using grep and wc
    for feature in "${features[@]}"
    do
        count=$(grep -v "^#" "$file" | cut -f3 | grep -w "$feature" | wc -l)
        line="$line\t$count"
    done
    echo -e "$line" >> "$output"
    echo "Finished $file."
done

echo "✅ Summary complete. Results saved to $output"
echo "===== Completed summarize_split_gffs_array.sh ====="

