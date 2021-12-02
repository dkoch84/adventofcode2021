## Advent of Code 2021

1.1

```bash
awk '$1 > x {print $1} {x = $1}' tmp.txt | wc -l | awk '{print $1-1}'
```

1.2

```bash
#!/bin/bash
i=0
a=0
mapfile -t data < tmp.txt
while [[ $i -lt $(expr ${#data[@]} - 3) ]]
do
  x=$(expr ${data[$i]} + ${data[$i+1]} + ${data[$i+2]})
  y=$(expr ${data[$i+1]} + ${data[$i+2]} + ${data[$i+3]})
  if [[ x -lt y ]]
  then
    a=$(expr $a + 1)
  fi
  i=$(expr $i + 1)
done
echo $a
```
