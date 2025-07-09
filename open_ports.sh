#!/bin/bash

open_ports=()

i=0

while [ $i -le 12000 ]; do
  out=$(nc -z -v 127.0.0.1 "$i" 2>&1)
  check=$(echo $out  | grep -i succeeded)
  if [ "$check" != "" ] ; then
     open_ports+=("$i")
  fi
  ((i++))
done

echo "$(date '+%Y-%m-%d %H:%M:%S')" >> /opt/scan.log
echo "Open ports:" >> /opt/scan.log
echo "${open_ports[@]}" >> /opt/scan.log
