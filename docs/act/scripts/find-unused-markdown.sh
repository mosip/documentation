#!/bin/bash
# Create a script: find-unused-md.sh

echo "Finding markdown files not referenced in summary.md..."

# Get all markdown files except summary.md
find . -name "*.md" ! -name "summary.md" > /tmp/all_md.txt

# Check each markdown file if it's referenced in summary.md
while read mdfile; do
    # Remove leading ./ and check if referenced
    clean_path=$(echo "$mdfile" | sed 's|^\./||')
    if ! grep -q "$clean_path" summary.md; then
        echo "Not in TOC: $mdfile"
    fi
done < /tmp/all_md.txt