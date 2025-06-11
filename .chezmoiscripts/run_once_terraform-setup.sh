#!/usr/bin/env bash

if [ ! -d "$HOME/.terraform.d/plugin-cache" ]; then
  echo "Create terraform plugin cache dir"
  mkdir -p "$HOME"/.terraform.d/plugin-cache
fi
