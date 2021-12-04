#!/bin/bash
forward=0
aim=0
depth=0
while read -r i
do
    token=$(echo $i | awk '{print $1}')
    value=$(echo $i | awk '{print $2}')
    case $token in
        forward)
            forward=$(expr $forward + $value)
            if [[ $aim -gt 0 ]]
            then
                depth=$(expr $depth + $(expr $value "*" $aim))
            fi
        ;;
        down)
            aim=$(expr $aim + $value)
        ;;
        up)
            aim=$(expr $aim - $value)
        ;;
    esac
done < day2.txt

echo $( expr $forward "*" $depth)
exit 0