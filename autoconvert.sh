#!/bin/bash

for file in docs/**/*.md; do
    rst="$(echo $file | sed 's/\.md$/.rst/')"
    pandoc --from=markdown --to=rst --wrap=none --output="$rst" "$file"
done
