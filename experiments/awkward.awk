#!/usr/bin/awk -f

BEGIN {
    FS = ""
}
{
    i=0
    while (i < NF) {
        print $i
        i++
    }
}
 


