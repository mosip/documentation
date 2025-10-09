import re
import csv

input_file = "docs/summary.md"
output_file = "docs/navigation.csv"

rows = []
current = []
top_level = ""

with open(input_file, "r") as f:
    for line in f:
        # Detect Markdown headings as new top-level topics
        heading_match = re.match(r'^\s*##+\s*(.+)', line)
        if heading_match:
            top_level = heading_match.group(1).strip()
            current = [top_level]
            continue
        # Match lines like: * [Title](link)
        match = re.match(r'^([\t ]*)\* \[([^\]]+)\]\(([^)]+)\)', line)
        if match:
            indent = match.group(1)
            name = match.group(2)
            link = match.group(3)
            # Each level is 2 spaces or 1 tab
            level = indent.count('\t') + indent.count(' ') // 2
            # If starting a new top-level, use heading
            if level == 0 and top_level:
                current = [top_level, name]
            else:
                # Extend or trim current to the right depth
                if len(current) <= level:
                    current += [""] * (level + 1 - len(current))
                current[level] = name
            # Reset all deeper levels (levels > current)
            for i in range(level + 1, len(current)):
                current[i] = ""
            # Pad to max depth for CSV consistency
            row = current + [""] * (10 - len(current)) + [link]
            rows.append(row)

# Find max depth for header
max_depth = max(len([col for col in row if col]) for row in rows)
level_names = [f"Level {i+1}" for i in range(max_depth)]
header = level_names + ["File/Link"]

with open(output_file, "w", newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(header)
    for row in rows:
        writer.writerow(row[:max_depth] + [row[-1]])