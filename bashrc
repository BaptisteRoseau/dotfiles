#!/bin/bash
for file in ~/.shrc/*.sh; do
    source "${file}"
done

if [[ -f /opt/Modules/init/bash ]]; then
    source /opt/Modules/init/bash
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
