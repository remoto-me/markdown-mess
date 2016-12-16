#!/bin/bash

for file in docs/**/*.md; do
    rst="$(echo $file | sed 's/\.md$/.rst/')"
    pandoc --from=markdown --to=rst --output="$rst" "$file"
done
