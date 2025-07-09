#!/bin/bash

disk_usage=$(df -h)

pretty=$(echo "$disk_usage" | awk 'NR>1 && $5+0>10 {print $1, $5}')

echo $pretty
