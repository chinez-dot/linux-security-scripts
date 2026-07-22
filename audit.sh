#!/bin/bash
echo "=== Security Audit ==="
Current_Usr=$(whoami)
echo "Current user : $Current_Usr"
echo "=== Checking Readability ==="
if [ -r "/etc/shadow" ]; then
echo "shadow is readable - WARNING"
else
echo "shadow not readable - GOOD"
fi

echo "=== Checking Files ==="
for FILE in /tmp /etc/passwd  /etc/shadow; do
if [ -e "$FILE" ]; then
echo "EXISTS : $FILE"
else 
echo "MISSING : $FILE"
fi
done

echo "=== SUID AUDIT ==="
KNOWN_GOOD="/usr/bin/su /usr/bin/passwd /usr/bin/sudo.ws /usr/bin/mount /usr/bin/umount /usr/bin/chsh /usr/bin/chfn /usr/bin/fusermount3 /usr/bin/gpasswd"
SUID_FILES=$(find /usr/bin /usr/sbin /bin /sbin -perm -4000 -type f 2>/dev/null)

if [ -z "$SUID_FILES" ]; then
    echo "No SUID binaries found"
else
    echo "Checking SUID binaries..."
    for BIN in $SUID_FILES; do
        if echo "$KNOWN_GOOD" | grep -q "$BIN"; then
            echo "OK      : $BIN"
        else
            echo "WARNING : $BIN — unexpected SUID binary"
        fi
    done
fi
echo "=== DONE ==="
