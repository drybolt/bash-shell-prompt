##### REFERENCEs #####
# https://natelandau.com/my-mac-osx-bash_profile/


##### EXPORTs #####
# export PS1="\e[1;30mmac \w \e[m || \e[1;32m \$(parse_git_branch) \e[m || \e[1;32m\n\$\e[m "
export PS1="\e[1;30mmac \w \e[m\e[1;32m\$(parse_git_branch) \e[m \e[1;32m\n\$\e[m "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR="/usr/bin/vim"


##### ALIASis #####
alias ls='ls -h'
alias ll='ls -lh'
alias la='ls -alh'


##### PATHs #####
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/bin/"


##### COMPLETIONs #####
# awscli auto completion
complete -C '/usr/local/bin/aws_completer' aws

# Kubectl auto completion and short key
# https://varlogdiego.com/kubectl-autocompletion-in-macos
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#enabling-shell-autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source ~/.kube/kubectl_autocompletion
alias k=kubectl
complete -F __start_kubectl k

# Git Auto-completion and shell prompt
source ~/bin/git-completion.bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}