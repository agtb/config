# .bashrc
source ~/bin/.git-prompt.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

umask 002

PS1="\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h\[\033[0;34m\]\$(__git_ps1)\n\
[\033[1;34m\]\w\[\033[0m\]\n$ "

# User specific aliases and functions
alias grep='grep --color=always'
alias h=history
alias j=jobs
alias less='less -MR'
alias ls='ls -a --color=auto --group-directories-first'
alias ll='ls -alG'
alias lll='ls -l | less'
alias ow='dolphin . &'

# Git
alias g='git'
alias ga='git add .'
alias gc='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git pull; .git/hooks/post-merge'
alias gs='git status'
alias gl='git log --stat=120'
alias gwtf='git log --follow -p' # file name

# Homestead / VirtualBox
alias vhalt='cd ~/Documents/Homestead && vagrant halt && cd -'
alias vreload='cd ~/Documents/Homestead && vagrant reload --provision && cd -'
alias vssh='cd ~/Documents/Homestead && vagrant ssh && cd -'
alias vsuspend='cd ~/Documents/Homestead && vagrant suspend && cd -'
alias vup='cd ~/Documents/Homestead && vagrant up && cd -'

# Dev
alias xphp="php -d xdebug.profiler_enable=On -d xdebug.profiler_output_dir=."
xxddiff() ( f() ( xxd "$1" ; ); diff -y <(f "$1") <(f "$2") | colordiff; )

function dt
{
    date +%Y%m%d-%H%M
}

function commit
{
    echo $(curl -s http://whatthecommit.com/index.txt)
}

function bofh()
{
    echo | curl telnet://towel.blinkenlights.nl:666
}
