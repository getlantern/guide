#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <repo-dir>"
	exit 1
fi

checksum_file="CHECKSUM"
cd "$1" || exit 1
checksum_file_path="../$checksum_file"

current_hash=$(git rev-parse HEAD)

if [[ -f "$checksum_file" ]]; then
	echo "No checksum file found, creating one."
	echo "$current_hash" >"$checksum_file"
	exit 1
fi

if ! grep -qx "$current_hash" "$checksum_file"; then
	echo "Changes detected, updating checksum file."
	echo "$current_hash" >"$checksum_file"
	exit 1
if

echo "No changes detected, already current, skipping update."
