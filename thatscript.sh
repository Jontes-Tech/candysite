#!/bin/bash

# Define the source and target directories
src_dir="public/images"
target_dir="src/projects"

# Loop over all .webp files in the source directory
for file in "$src_dir"/*.webp; do
    # Extract the filename and remove the extension
    filename=$(basename "$file")
    # Split the filename by '_' and get the second part (the slug)
    slug=${filename#*_}
    slug=${slug%.*}
    # number is the first part of the filename, before the '_'
    number=${filename%%_*}
    # Multiline string to be written to the target file
    target_string="---
title: $slug
date: $(date +%Y-%m-%d)
number: $number
---
"
echo "$target_string" > "$target_dir/$slug.md"
done