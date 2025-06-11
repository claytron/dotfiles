#!/usr/bin/env bash
input_status=$(amixer get Capture | grep -E '^\s+Front Left' | sed -E 's/.*\[(.*)\]/\1/')
echo "input $input_status"
