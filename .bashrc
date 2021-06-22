# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
P_BOLD="\[$(tput bold)\]"
P_BLACK="\[$(tput setaf 0)\]"
P_RED="\[$(tput setaf 1)\]"
P_GREEN="\[$(tput setaf 2)\]"
P_YELLOW="\[$(tput setaf 3)\]"
P_BLUE="\[$(tput setaf 4)\]"
P_MAGENTA="\[$(tput setaf 5)\]"
P_CYAN="\[$(tput setaf 6)\]"
P_WHITE="\[$(tput setaf 7)\]"
P_RESET="\[$(tput sgr0)\]"
export PS1="$P_BOLD$P_GREEN[ \u$P_RED@$P_YELLOW\h $P_CYAN\w$_PGREEN ]$ $P_RESET"

function repo_statuses () {
    CWD=$( pwd )
    for DIR in $( find . -name '.git' ); do REPO=${DIR%%.git}; cd $REPO; echo -e "\n$REPO"; git status -s; cd $CWD; done
}

function secure_eyaml () {
    NOM="$1"
    shift
    eyaml $NOM --pkcs7-private-key $HOME/.puppet/private_key.pkcs7.pem --pkcs7-public-key $HOME/.puppet/public_key.pkcs7.pem $*
}

alias ssh='TERM=xterm ssh'
alias cat_yamls='find . -name "*.yml" -print -exec cat {} \; | less'

export SVN_EDITOR=/usr/bin/vim
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
complete -C $HOME/bin/terraform terraform
