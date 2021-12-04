#!/bin/bash
awk '$1 > x {print $1} {x = $1}' day1.txt | wc -l | awk '{print $1-1}'
exit 0