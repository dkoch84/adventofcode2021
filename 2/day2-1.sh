#!/bin/bash
forward=$(grep forward day2.txt | awk '{sum+=$2;} END{print sum;}')
down=$(grep down day2.txt | awk '{sum+=$2;} END{print sum;}')
up=$(grep up day2.txt | awk '{sum+=$2;} END{print sum;}')

depth=$(expr $down - $up)
echo $(expr $depth "*" $forward)
exit 0