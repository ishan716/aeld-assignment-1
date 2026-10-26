#!/bin/sh
# Usage: writer.sh <writefile> <writestr>
# Writes writestr into writefile, creating the directory path if needed.

if [ $# -lt 2 ]; then
    echo "Error: missing arguments"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Create the parent directory (and any missing directories above it)
if ! mkdir -p "$(dirname "$writefile")"; then
    echo "Error: could not create directory for $writefile"
    exit 1
fi

# Write the string to the file, overwriting any existing content
if ! echo "$writestr" > "$writefile"; then
    echo "Error: could not create file $writefile"
    exit 1
fi
