#!/bin/bash

echo "Please enter target directory" 
read target

files=$(find "$target" -type f -size +10M -exec du -h {} \;)

echo "$files"

