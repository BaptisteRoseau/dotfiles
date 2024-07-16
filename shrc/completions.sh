#!/usr/bin/env bash

if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init bash)"
fi

if [ -x "$(command -v k3s)" ]; then
  eval "$(k3s completion bash)"
fi

if [ -x "$(command -v kubectl)" ]; then
  eval "$(kubectl completion bash)"
fi
