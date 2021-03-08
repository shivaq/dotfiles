if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

##################################
# PATH
##################################
# for local scripts
export PATH=$PATH":$HOME/bin"
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$HOME/bin:$PATH"

##################################
# Common
##################################
## aliases
alias ll='ls -la'
alias llg='ll | grep'

alias scbp='source $HOME/.bash_profile'
alias cdsm="cd ~/Dropbox/01.study/01.Study_Memo"


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
# Dotfiles
##################################
alias cddf='cd $HOME/001.LocalRepository/GitHub/dotfiles/'

##################################
# Python
##################################
alias cdlp='cd $HOME/Dropbox/01.study/00.Git/05.Lambda/01.Python'
alias cdpy='cd $HOME/001.LocalRepository/GitHub/501.Python'


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

##################################
# JavaScript
##################################
alias cdjs='cd $HOME/001.LocalRepository/GitHub/502.JavaScript'

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

# Npm
export PATH=~/.npm-global/bin:$PATH


##################################
# AWS
##################################
# AWS_PROFILE is not work as you expected because of backward compatibility for aws cli...
alias aws='aws --profile ${AWS_PROFILE:-""}'

## For CloudFormation
alias cdcf='cd ~/001.LocalRepository/GitHub/001.Aws/001.CloudFormation'

## For serverless
alias cdsl='cd ~/Dropbox/01.study/00.Git/06.ServerlessFramework/10.Programs/00.Shell/Shells_for_aws/'

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
# Docker
##################################
alias cddc='cd $HOME/001.LocalRepository/GitHub/100.docker_practice'
alias dcbih='docker build -t shivaq/start_in_my_head:0.1 .'
alias dc='docker'
alias dcc='docker container'
alias dci='docker images'

##################################
# Kubernetes
##################################
alias mksih='minikube service in-my-head'
alias k=kubectl
alias kget='kubectl get'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
alias kall='kubectl get all --all-namespaces'
alias kex='kubectl explain'
alias kdes='kubectl describe'
alias kdel='kubectl delete'
alias kapf='kubectl apply -f'
alias mks='minikube service'






##################################
# DB
##################################
# For PostgreSQL
alias cdpg='cd ~/psgl_practice'
