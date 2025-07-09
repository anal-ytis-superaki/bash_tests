#!/bin/bash

target_services=(python-server ssh sshd docker)
target_file=/opt/etc/services.log

running_services=()
dead_services=()
non_existent=()

for ser in "${target_services[@]}" ; do
    status=$(systemctl status "$ser" 2>&1)
    status_check=$(echo "$status" | grep -i running)
    if [[ -n $status_check ]]; then
        running_services+=("$ser")
    fi
    status_check=$(echo "$status" | grep -i dead)
    if [[ -n $status_check ]]; then
        dead_services+=("$ser")
    fi
    status_check=$(echo "$status" | grep -i found)
    if [[ -n $status_check ]]; then
        non_existent+=("$ser")
    fi
done

echo "$(date '+%Y-%m-%d %H:%M:%S')" >> "$target_file"
echo "Running services:  ${running_services[@]}" >> "$target_file"
echo "Dead services:  ${dead_services[@]}" >> "$target_file"
echo "Not installed services:  ${non_existent[@]}" >> "$target_file"


