#!/bin/bash

# Define the output file
output_file="all_code.txt"

# Clear the output file if it already exists
> "$output_file"

# Find and concatenate all code files
find . -type f \( -name "*.html" -o -name "*.scss" -o -name "*.js" -o -name "*.py" -o -name "*.md" \) -print0 | while IFS= read -r -d '' file; do
  echo "Processing $file"
  echo "----- $file -----" >> "$output_file"
  cat "$file" >> "$output_file"
  echo -e "\n\n" >> "$output_file"
done

echo "All code has been concatenated into $output_file"