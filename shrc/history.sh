# Avoid duplicates and commands starting with a space
HISTCONTROL=ignoreboth

HISTSIZE=10000
HISTFILESIZE=20000

# After each command, append to history and reload it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
