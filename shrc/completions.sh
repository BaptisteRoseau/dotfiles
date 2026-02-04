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

if [ -x "$(command -v helm)" ]; then
  eval "$(helm completion bash)"
fi

if [ -x "$(command -v podman)" ]; then
  eval "$(podman completion bash)"
fi

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
fi
