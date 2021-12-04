#!/bin/bash

ws=$(cat day3.txt)
sw=$ws
bits=$(head -n 1 <(echo "$ws") | awk 'BEGIN {FS = ""}{print NF}')

function reset {
  head=0
  dots=""
  i=1
}

function o2 {
  zeros=$(awk -v col=$i 'BEGIN {FS=""}{print $col}' <(echo "$ws") | grep -c 0)
  ones=$(awk -v col=$i 'BEGIN {FS=""}{print $col}' <(echo "$ws") | grep -c 1)
  if [[ $zeros -gt $ones ]]; then
    head=0
  else
    head=1
  fi
}

function co2 {
  zeros=$(awk -v col=$i 'BEGIN {FS=""}{print $col}' <(echo "$sw") | grep -c 0)
  ones=$(awk -v col=$i 'BEGIN {FS=""}{print $col}' <(echo "$sw") | grep -c 1)
  if [[ $zeros -gt $ones ]]; then
    head=1
  else
    head=0
  fi
}

reset
while [[ $i -le $bits ]]; do
  if [[ $(echo "$ws" | wc -l) -eq 1 ]]; then
    break
  fi
  o2
  ws=$(sed "/^$dots$head/d" <(echo "$ws"))
  dots="${dots}."
  let i++
done

reset
while [[ $i -le $bits ]]; do
  if [[ $(echo "$sw" | wc -l) -eq 1 ]]; then
    break
  fi
  co2
  sw=$(sed "/^$dots$head/d" <(echo "$sw"))
  dots="${dots}."
  let i++
done

echo $(($(echo $((2#$ws))) * $(echo $((2#$sw)))))
exit 0