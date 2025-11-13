#!/bin/bash

DATA="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"
OUT="largest_individual.txt"

echo "===== Running largest_individual.sh ====="

# longest male
m_row=$(grep ",M," "$DATA" | sort -t',' -k4,4n | tail -n 1)
m_len=$(echo "$m_row" | cut -d',' -f4)
m_site=$(echo "$m_row" | cut -d',' -f2)

# longest female
f_row=$(grep ",F," "$DATA" | sort -t',' -k4,4n | tail -n 1)
f_len=$(echo "$f_row" | cut -d',' -f4)
f_site=$(echo "$f_row" | cut -d',' -f2)

# same site?
if [ "$m_site" = "$f_site" ]; then
    same="YES"
else
    same="NO"
fi

{
  echo "Longest male (mm): $m_len"
  echo "Collected at site: $m_site"
  echo "Longest female (mm): $f_len"
  echo "Collected at site: $f_site"
  echo "Same site? $same"
} > "$OUT"

echo "Done. Output written to $OUT"

