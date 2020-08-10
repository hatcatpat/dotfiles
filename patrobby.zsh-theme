#PROMPT="%(?:%{$fg_bold[blue]%}➜:%{$fg_bold[red]%}➜ )"
PROMPT=' %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}X"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
