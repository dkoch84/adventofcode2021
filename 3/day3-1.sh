#!/bin/bash
bits=$(head -n 1 day3.txt | awk 'BEGIN {FS = ""}{print NF}')
i=1
delta=""
epsilon=""

while [[ $i -le $bits ]]; do
    line=$(awk -v col=$i 'BEGIN {FS = ""}{print $col}' day3.txt |\
        sort -n |\
        grep -n 1 |\
        head -n 1 |\
        cut -d: -f 1)
    if [[ $line -gt 500 ]]; then
        delta="${delta}0"
        epsilon="${epsilon}1"
    else
        delta="${delta}1"
        epsilon="${epsilon}0"
    fi
    let i++
done

echo $(( $(echo "$((2#$delta))") "*" $(echo "$((2#$epsilon))")))
exit 0