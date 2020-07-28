if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

##################################
# PATH
##################################
# for local scripts
export PATH=$PATH":$HOME/bin"
export PATH="/usr/local/bin:$HOME/bin:$PATH"


##################################
# Dotfiles
##################################
alias cddf='cd $HOME/Documents/dotfiles'

##################################
# Python
##################################
alias cdlp='cd $HOME/Dropbox/01.study/00.Git/05.Lambda/01.Python'






##################################
# Infrastructure
##################################
# For Docker
alias cddc='cd ~/docker_practice'

## For CloudFormation
alias cdcf='cd ~/Dropbox/01.study/00.Git/01.CloudFormation/'

## For serverless
alias cdsl='cd ~/Dropbox/01.study/00.Git/06.ServerlessFramework/10.Programs/00.Shell/Shells_for_aws/'





##################################
# Python
##################################
## For python
alias cdpy='cd ~/PycharmProjects'





##################################
# DB
##################################
# For PostgreSQL
alias cdpg='cd ~/psgl_practice'
