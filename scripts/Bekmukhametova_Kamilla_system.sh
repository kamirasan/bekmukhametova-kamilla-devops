#!/bin/bash
# System information script - Bekmukhametova Kamilla, ID 38239

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INFO_FILE="$PROJECT_DIR/Bekmukhametova_Kamilla_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Kamilla"
echo "Surname: Bekmukhametova"
echo "Group: IT2-2313"
echo "Student ID: 38239"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s) $(uname -r)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
if command -v free >/dev/null 2>&1; then
    free -h
else
    top -l 1 | grep PhysMem
fi
echo "=============================="

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
