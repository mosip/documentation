#!/bin/bash
# Create a script: find-unused-images.sh

echo "Finding unused images..."

# Find all image files
find . -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.svg" > /tmp/all_images.txt

# Find all markdown files and search for image references
find . -name "*.md" -exec grep -l "\!\[.*\](" {} \; > /tmp/md_with_images.txt

# Check each image if it's referenced
while read image; do
    image_name=$(basename "$image")
    if ! grep -r "$image_name" --include="*.md" . > /dev/null; then
        echo "Unused image: $image"
    fi
done < /tmp/all_images.txt