#!/bin/bash

DATA="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"
OUT="urbanization_classification.txt"

echo -e "Site_Code\tClass" > "$OUT"

cut -d',' -f2 "$DATA" | tail -n +2 | sort | uniq > sites.list

while read -r site
do
    # Correct pattern for column 2
    ip=$(grep "^[^,]*,${site}," "$DATA" | head -n 1 | cut -d',' -f5)

    # Remove hidden CR
    ip="${ip//$'\r'/}"

    if [ -z "$ip" ]; then
        class="Unknown"
    elif [ "$ip" -lt 15 ]; then
        class="Rural"
    elif [ "$ip" -lt 50 ]; then
        class="Suburban"
    else
        class="Urban"
    fi

    echo -e "${site}\t${class}" >> "$OUT"
done < sites.list

