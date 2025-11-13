#!/bin/bash

DATA="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"
OUT="measurer_summary.txt"

echo "===== Running Measurer_summary.sh ====="

# Get measurer list (column 1)
cut -d',' -f1 "$DATA" | tail -n +2 | sort | uniq > measurers.list

# Get site classification first
cut -d',' -f2 "$DATA" | tail -n +2 | sort | uniq > sites.list

# Build site classification file
echo -e "Site\tClass" > site_class.tmp

while read -r site
do
    ip=$(grep "^[^,]*,${site}," "$DATA" | head -n 1 | cut -d',' -f5)
    ip="${ip//$'\r'/}"

    if [ "$ip" -lt 15 ]; then
        class="Rural"
    elif [ "$ip" -lt 50 ]; then
        class="Suburban"
    else
        class="Urban"
    fi

    echo -e "$site\t$class" >> site_class.tmp
done < sites.list

# Output header
echo -e "Measurer\t#Samples\t#Rural\t#Suburban\t#Urban" > "$OUT"

# For each measurer:
while read -r m
do
    rows=$(grep "^${m}," "$DATA")
    total=$(echo "$rows" | wc -l)

    # init counters
    rural=0; suburban=0; urban=0

    while read -r site class
    do
        c=$(echo "$rows" | grep "^[^,]*,${site}," | wc -l)

        if [ "$class" = "Rural" ]; then
            rural=$((rural + c))
        elif [ "$class" = "Suburban" ]; then
            suburban=$((suburban + c))
        else
            urban=$((urban + c))
        fi

    done < site_class.tmp

    echo -e "${m}\t${total}\t${rural}\t${suburban}\t${urban}" >> "$OUT"
done < measurers.list

echo "Done. Output written to $OUT"

