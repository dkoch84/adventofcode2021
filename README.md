## Advent of Code 2021

1.1

```bash
awk '$1 > x {print $1} {x = $1}' day1.txt | wc -l | awk '{print $1-1}'
```

1.2

```bash
#!/bin/bash
i=0
a=0
mapfile -t data < day1.txt
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

2.1

```bash
#!/bin/bash
forward=$(grep forward day2.txt | awk '{sum+=$2;} END{print sum;}')
down=$(grep down day2.txt | awk '{sum+=$2;} END{print sum;}')
up=$(grep up day2.txt | awk '{sum+=$2;} END{print sum;}')

depth=$(expr $down - $up)
echo $(expr $depth "*" $forward)
```

```bash
#!/bin/bash
forward=0
down=0
up=0
while read -r i
do
  token=$(awk '{print $1}')
  case $token in
    forward)
      echo "forward"
      ;;
    down)
      echo "down"
      ;;
    up)
      echo "up"
      ;;
  esac
done
```

2.2

```bash
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
```
