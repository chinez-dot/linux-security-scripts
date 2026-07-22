#!/bin/bash
AUTH_LOG="/var/log/auth.log"
echo "=== Failed Login Report ==="

if [ ! -r "$AUTH_LOG" ]; then
    echo "ERROR: cannot read auth log"
    exit 1
fi

echo "=== Searching Failed Attempts ==="
grep -i "failed\|invalid" "$AUTH_LOG"

COUNT=$(grep -i "failed\|invalid" "$AUTH_LOG" | wc -l)
echo "Total failed attempts: $COUNT"
echo "=== End of Report ==="
