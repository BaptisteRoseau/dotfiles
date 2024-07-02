#/usr/bin/env bash
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias xc='xclip -sel clip'
alias mkdir='mkdir -p'
alias sts='git status'
alias fixmouse='sudo /root/scripts/unplug_and_replug_mouse.sh'
alias pyvenv='python3 -m venv .venv && source .venv/bin/activate'
eval "$(zoxide init --cmd "cd" bash)"
