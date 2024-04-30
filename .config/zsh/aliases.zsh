# Command aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias cd..='cd ..'
alias cp='cp -iv'
alias chmod="chmod -c"
alias chown="chown -c"
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias egrep='egrep --colour=auto'
alias extip='curl icanhazip.com'
alias grep='grep --color=auto'
alias l.='ls -lhFa --time-style=long-iso --color=auto'
alias ll='ls'
alias ln='ln -iv'
alias ls='eza --icons -a --group-directories-first'
alias lsmount='mount |column -t'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias ports='netstat -tulanp'
alias j='jobs -l'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ssha='eval $(ssh-agent) && ssh-add'
alias watch='watch -d'
alias wget='wget -c'
alias vim='nvim'
alias lf='lf-ueberzug'

# Safetynets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Package management
alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt clean'
alias install='sudo apt install'

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
