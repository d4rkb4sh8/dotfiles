# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# colorize output
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh


#Brightness control from keybaord
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up "['<Ctrl><Super>Up']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down "['<Ctrl><Super>Down']"

#path
export PATH=$PATH::/home/h4ck3r/.cargo/bin:home/h4ck3r/go/bin:/home/h4ck3r/.local/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/opt:/snap/bin:/usr/bin:/usr/games:/usr/local/bin


# preferred text editor
EDITOR=nano

#homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#ble.sh
source ~/.local/share/blesh/ble.sh

#pipx
eval "$(register-python-argcomplete pipx)"

#most - colorful output for man
#export PAGER=most

#highlight less
export LESSOPEN="| /usr/bin/highlight %s --out-format xterm256 --force"

# greet me
echo "w3lc0m3 h4ck3r - let the games begin! - m4ast3r y0ur cr4ft"  | lolcat


# Atuin
. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"




#starship prompt - shell prompt
eval "$(starship init bash)"


#custom prompt
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)"); PS1_CMD2=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"')'; PS1='\n\[\e[38;5;199;1m\]\u\[\e[0;97;2m\]@\[\e[0;38;5;129;1m\]\h\[\e[0m\]: \[\e[38;5;51m\]\w\n\[\e[93;3m\]${PS1_CMD1}\[\e[0m\] \[\e[38;5;42m\]${PS1_CMD2}\[\e[0m\] \[\e[90;2m\]status\[\e[0m\] \[\e[97;2m\]$?\[\e[0m\] \[\e[95;2;3m\]\t\n\[\e[23;38;5;201m\]\$\[\e[0m\] '
