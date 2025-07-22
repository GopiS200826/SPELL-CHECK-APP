#!/bin/bash
set -e

echo "🔍 Running spell check..."
error=0

for file in $(find . -type f \( -name "*.md" -o -name "*.txt" -o -name "*.py" \)); do
  echo "📄 Checking: \$file"
  misspelled=\$(aspell list < "\$file" | sort | uniq)
  if [ -n "\$misspelled" ]; then
    echo "❌ Spelling mistakes found in \$file:"
    echo "\$misspelled"
    error=1
  fi
done

exit \$error
