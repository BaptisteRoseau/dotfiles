#!/usr/bin/env bash

# Custom Tools
export PATH="$PATH:$HOME/.bin"

# Modules
export MODULES_ROOT=/opt/Modules
export PATH="$PATH:$MODULES_ROOT/bin:$MODULES_ROOT/libexec"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MODULES_ROOT/lib"
export MANPATH="$MANPATH:$MODULES_ROOT/share/man"
export MODULEPATH=$MODULES_ROOT/modulefiles
