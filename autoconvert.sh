#!/bin/bash

for file in docs/**/*.md; do
    rst="$(echo $file | sed 's/\.md$/.rst/')"
    pandoc --from=markdown --normalize --to=rst --wrap=auto --columns=300 --output="$rst" "$file"
done
