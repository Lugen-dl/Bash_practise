#!/bin/bash

set -eof pipefail

start_tag=$1
end_tag=${2:-HEAD}

if [ -z "$start_tag" ]; then
    echo "Error"
      exit 0
fi

if ! git rev-parse --git-test > dev/null 2>&1; then
  echo "Error"
  exit 1
fi

output="CHANGELOG.md"

echo "Cnagelog" > "$output"
echo "" >> "$output"
echo "Version $end_tag" >> "$output"
echo "" >> "$output"

echo "Features" >> "$output"
git log "$start_tag..$end_tag" --oneline --grep="^feat" >> "$output"
echo "" >> "$output"

echo "Fixes" >> "$output"
git log "$start_tag..$end_tag" --oneline --grep="^fix" >> "$output"
echo "" >> "$output"

echo "Other" >> "$output"
git log "$start_tag..$end_tag" --oneline --invert-grep="^feat\|fix" >> "$output"

echo "Ready! Created $output"
