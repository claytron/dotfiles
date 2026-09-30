#!/usr/bin/env bash

echo "set up worktrunk"

if which wt >/dev/null; then
  echo "for claude"
  wt config plugins -y claude install
  echo "for codex"
  wt config plugins -y codex install
  echo "for pi"
  wt config plugins -y pi install
fi
