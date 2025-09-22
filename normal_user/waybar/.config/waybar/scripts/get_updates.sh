#!/bin/bash
# Check for available Ubuntu updates and print the count

updates=$(apt list --upgradeable 2>/dev/null | grep -v "Listing..." | wc -l)
if [ "$updates" -gt 0 ]; then
  echo "$updates"
else
  echo "0"
fi