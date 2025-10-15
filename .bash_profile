#!/bin/bash
# shellcheck source=/dev/null
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,gitdots,tmuxdots,pythondots,javadots,javascriptdots,golangdots,nodejsdots,awsdots,gcpdots,terraformdots,dockerdots,k8sdots,dbdots,secretdots,functions,extra,inmyheaddots,rubydots}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(direnv hook zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# command completion
eval "$(gh completion -s zsh)"

complete -C /usr/local/bin/terraform terraform

echo "Reloaded!"
