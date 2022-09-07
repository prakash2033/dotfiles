alias ls='ls --color'
autoload -U colors && colors
export PS1="%{$fg[green]%}%n@%m %{$fg[blue]%}%~ %{$fg[green]%}$ %{$reset_color%}"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
