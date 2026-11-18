#!/bin/bash
# Render every look into planning/variants/<name>/ (gitignored) and serve them for comparison.
# Usage: ./build-variants.sh   (then open http://localhost:4300/)
set -e
cd "$(dirname "$0")"
export QUARTO_PYTHON="$PWD/.venv/bin/python3"
for v in quiet editorial index; do
  rm -rf "planning/variants/$v"
  quarto render --profile "$v" --output-dir "planning/variants/$v" --quiet
  echo "rendered $v"
done
