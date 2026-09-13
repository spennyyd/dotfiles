# Load Angular CLI autocompletion.
source <(ng completion script)

parse_git_branch(){
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF='%f'
COLOR_USR='%F{49}'
COLOR_DIR='%F{46}'
COLOR_GIT='%F{86}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}> '

# Alias
alias tmux-session='~/launch-tmux.sh'

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --oneline --long --icons=always'
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
