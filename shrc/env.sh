#!/usr/bin/env bash
. "$HOME/.cargo/env"

# Custom Tools
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$PATH"

#TMP Support tracker
export PATH="$HOME/Documents/time_tracker:$PATH"

# Modules
export MODULES_ROOT=/opt/Modules
export PATH="$PATH:$MODULES_ROOT/bin:$MODULES_ROOT/libexec"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MODULES_ROOT/lib"
export MANPATH="$MANPATH:$MODULES_ROOT/share/man"
export MODULEPATH=$MODULES_ROOT/modulefiles

# Podman Desktop
export PODMAN_DESKTOP_ROOT=/opt/podman-desktop/1.7.1
export PATH="$PATH:$PODMAN_DESKTOP_ROOT"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PODMAN_DESKTOP_ROOT"

# Neovim
NVIM_ROOT="/opt/nvim"
export PATH="$PATH:$NVIM_ROOT/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$NVIM_ROOT/lib"
export MANPATH="$MANPATH:$NVIM_ROOT/man"

# Lumen
export LUMEN_AI_PROVIDER="ollama"
export LUMEN_AI_MODEL="deepseek-coder-v2:latest"

