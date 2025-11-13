#!/bin/bash
# Author: Lu Li
# Purpose: Report #unique sites and per-site counts (total, #M, #F)
# Allowed tools only: grep, cut, sort, uniq, wc, echo, head, tail

echo "===== Starting sampling_summary.sh ====="

DATA="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"
OUT="sampling_summary.txt"

# list of unique site codes (skip header)
cut -d',' -f2 "$DATA" | tail -n +2 | sort | uniq > sites.list
n_sites=$(wc -l < sites.list)

{
  echo -e "Number of sites:\t${n_sites}"
  echo -e "Site_Code\tN_Samples\tN_Males\tN_Females"
} > "$OUT"

# for each site, count total, M, F
while read -r site; do
  rows_site=$(grep ",${site}," "$DATA")
  n_total=$(echo "$rows_site" | wc -l)
  n_m=$(echo "$rows_site" | grep ",M," | wc -l)
  n_f=$(echo "$rows_site" | grep ",F," | wc -l)
  echo -e "${site}\t${n_total}\t${n_m}\t${n_f}" >> "$OUT"
  echo "[OK] ${site}: total=$n_total M=$n_m F=$n_f"
done < sites.list

echo "✅ Done. Wrote $OUT"
echo "===== Completed sampling_summary.sh ====="

