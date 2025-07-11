#!/bin/bash

target_dir=/opt/etc
target_files="logfile_"
size_thresh=20 #in KB
byte_thresh=$(( size_thresh * 1024))

counter=0

for file in "$target_dir"/${target_files}*.log; do
    [[ -f "$file" ]] || continue
    size=$(stat -c %s "$file")

    echo "Number: $counter size: $size bytes"
    ((counter++))

    if ((size > byte_thresh)); then
        file_name=$(basename "$file")
        mv "$target_dir/$file_name" "$target_dir/$file_name.bak"
        tar -czf "$target_dir/$file_name.targ.gz" "$target_dir/$file_name.bak"
        rm -f "$target_dir/$file_name.bak"
    fi
done
