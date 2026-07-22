# Linux Security Scripts

A small collection of Bash scripts for auditing basic security posture on a Linux system. Built from scratch while working through Linux fundamentals and security concepts (file permissions, log analysis, bash scripting).

## Scripts

### `audit.sh`
General-purpose security audit script. Runs a set of checks against the system and reports findings.

### `perm-audit.sh`
Scans file and directory permissions, flagging files with overly permissive or unusual access rights (e.g. world-writable files, unexpected SUID/SGID bits).

### `failed-logins.sh`
Parses system logs for failed login attempts, helping identify potential brute-force attempts or unauthorized access tries.

## Usage

```bash
chmod +x audit.sh perm-audit.sh failed-logins.sh
./audit.sh
./perm-audit.sh
./failed-logins.sh
```

> Note: some checks may require elevated privileges. Run with `sudo` if a script reports permission errors reading system files.

## Background

These scripts were built as part of a self-directed Linux and security fundamentals curriculum, covering file permissions, bash scripting, and log analysis — with the goal of building toward cloud security engineering and Security+ certification.

## Status

Actively maintained and expanded as new concepts are learned.

