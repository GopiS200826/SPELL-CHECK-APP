#!/bin/bash
set -e

echo "🔍 Running spell check..."
error=0

while IFS= read -r -d $'\0' file; do
  echo "📄 Checking: $file"
  misspelled=$(aspell list < "$file" | sort | uniq)
  if [ -n "$misspelled" ]; then
    echo "❌ Spelling mistakes found in $file:"
    echo "$misspelled"
    error=1
  fi
done < <(find . -type f \( -name "*.md" -o -name "*.txt" -o -name "*.py" \) -print0)

exit $error
