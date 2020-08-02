##################################
# PATH
##################################
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Golang
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# Npm
export PATH=~/.npm-global/bin:$PATH

# Comment out for zsh
# export PS1="\[\e[0m\]\u@\[\e[32m\]\h \[\e[33m\]\W\[\e[0m\] \[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\$ "
# export PS1='\[\e[0m\]\u@\[\e[32m\]\h \[\e[33m\]\W\[\e[0m\]\e[31m\]$(__git_ps1 " (%s)")\[\e[0m\]\$ '





##################################
# Common
##################################
## aliases
alias ll='ls -la'
alias llg='ll | grep'


alias scbp='source $HOME/.bash_profile'

##################################
# Git
##################################
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git checkout'
alias gst='git status'
alias gdc='git diff --cached'
alias gd='git diff'
alias gcv='git commit -v'
alias gcm='git commit -m '
alias gcan='git commit --amend --no-edit'


##################################
# tmux
##################################
# required for solarized color scheme
alias tm="TERM=screen-256color-bce tmux"
alias tmkl="tmux kill-server"





##################################
# Docker
##################################
alias dc='docker'
alias dcc='docker container'
alias dci='docker images'

##################################
# Kubernetes
##################################
alias k=kubectl
alias kget='kubectl get'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
alias kall='kubectl get all --all-namespaces'
alias kex='kubectl explain'
alias kdes='kubectl describe'

##################################
# aws cli
##################################
# AWS_PROFILE is not work as you expected because of backward compatibility for aws cli...
alias aws='aws --profile ${AWS_PROFILE:-""}'

##################################
# google cloud
##################################
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

##################################
# Terraform
##################################
alias cdtr='cd ~/operate_terraform'





##################################
# Golang
##################################
alias cdgp='cd $GOPATH'



##################################
# Node.js
##################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion









##################################
# Python
##################################
# Make pyenv to use /usr/loca/var/pyenv
export PYENV_ROOT=/usr/local/var/pyenv

# Make pyenv to provide auto complete function
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Set for Pipenv
export PIPENV_VENV_IN_PROJECT=true
if which pipenv > /dev/null; then eval "$(pipenv --completion)"; fi

# Set for python tbvaccine enabled globally
export TBVACCINE=1


alias flk='flake8 --show-source'
alias ap8='autopep8 -ivr'


# For pipenv
## use below with Pipfile scripts
alias pre="pipenv run execute"
alias prtc="pipenv run test"
export PIPENV_IGNORE_VIRTUALENVS=1

