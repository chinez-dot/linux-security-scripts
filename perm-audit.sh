#!/bin/bash
TARGET_DIR="/home/chinez"
echo "=== Permission Audit: $TARGET_DIR ==="

for FILE in $TARGET_DIR/*; do
    if find "$FILE" -maxdepth 0 -perm -o+w | grep -q .; then
        echo "DANGEROUS: world-writable — $FILE"
    elif find "$FILE" -maxdepth 0 -perm -o+r | grep -q .; then
        echo "WARNING: world-readable — $FILE"
    else
        echo "OK: $FILE"
    fi
done

echo "=== Audit Complete ==="
