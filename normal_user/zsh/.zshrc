# -------- Prompt with Git Info{{{
# https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html 
alias ls='ls --color'
autoload -U colors && colors
setopt autocd   # Automatically cd into typed directory.

# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info)

# Set up prompt (with git branch name)
setopt PROMPT_SUBST
export PS1='%F{green}[%D{%L:%M:%S%p}]%f %F{blue}%~%f ${vcs_info_msg_0_}%(?.%F{green}.%F{red})$%F{$reset_color%}%f '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '%F{166}!%f'
zstyle ':vcs_info:*' stagedstr '%F{040}+%f'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '%F{yellow}(%b%u%c%m%F{yellow})%f '
zstyle ':vcs_info:git:*' actionformats '%F{yellow}(%b|%a%u%c%F{yellow})%f '
zstyle ':vcs_info:(svn|bzr):*' branchformat '%F{yellow}%b:r%r%f '
zstyle ':vcs_info:bzr:*' use-simple true

 # Add up/down arrows after branch name, if there are changes to pull/to push
zstyle ':vcs_info:git+post-backend:*' hooks git-post-backend-updown
+vi-git-post-backend-updown() {
  git rev-parse @{upstream} >/dev/null 2>&1 || return
  local -a x; x=( $(git rev-list --left-right --count HEAD...@{upstream} ) )
  hook_com[branch]+="%f" # end coloring
  (( x[2] )) && hook_com[branch]+="%F{040}↓%f"
  (( x[1] )) && hook_com[branch]+="%F{166}↑%f"
  return 0
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{166}?%f'
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_
# }}}

#-------- Vim Mode {{{
#------------------------------------------------------
# enable vim mode on commmand line
bindkey -v

# edit command with editor
# http://stackoverflow.com/a/903973
# usage: type someshit then hit Esc+v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# no delay entering normal mode
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    # RPS1="$vcs_info_msg_0_ ${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    INSERT="%F{green}-- INSERT --%f"
    NORMAL="%F{blue}-- NORMAL --%f"
    RPS1="${${KEYMAP/vicmd/${NORMAL}}/(main|viins)/${INSERT}}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
# bindkey -a '^R' redo  # conflicts with history search hotkey
bindkey -a '^T' redo
bindkey '^?' backward-delete-char #backspace

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# }}}

# -------- Source {{{
# Load syntax highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Load zsh autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Brew Shell Completion for 
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# }}}

# -------- Basic auto/tab complete:{{{
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# }}}

# -------- History widget fzf{{{
fzf-history-widget() {
  local selected
  if selected=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -q "$LBUFFER" +s -e -i --tac --height 10% | sed 's/ *[0-9]* *//' ); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget
# }}}

#-------- Globbing {{{
#------------------------------------------------------

setopt extendedglob
unsetopt caseglob

# }}}

#-------- History {{{
#------------------------------------------------------
# get more info: $man zshoptions
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS        # pound sign in interactive prompt
HISTFILE=~/.zsh_history            # where to save zsh history
HISTSIZE=10000
SAVEHIST=10000
cfg-history() { $EDITOR $HISTFILE ;}

#
# }}}

#-------- For youtube-dl playback {{{
unsetopt nomatch
# }}}

# -------- Aliases {{{
alias h='cd $HOME && la' 
alias dox='cd ~/Documents' 
alias dl='cd ~/Downloads' 
alias px='cd ~/Pictures' 
alias mu='cd ~/Music' 
alias vv='cd ~/Videos' 
alias sc='cd ~/.scripts' 
alias cfg='cd ~/.config'  
alias repo='cd ~/Public/gitrepo' 
alias dot='cd ~/Public/gitrepo/dotfiles' 
alias dotv2='cd ~/Public/gitrepo/dotfiles_v2' 
alias notes='cd ~/Public/gitrepo/shownotes' 
alias wiki='cd ~/Public/gitrepo/wiki' 

alias dev='cd $HOME/dev'                                                       
alias tos='cd $HOME/dev/tote-tocc-tos'                                      
alias tosnew='cd $HOME/dev/tote-tocc-tos-new'                                  
alias db2='cd $HOME/dev/tote-tocc-db2service' 
alias label='cd $HOME/dev/tote-tocc-labelservice'                            
alias vin='cd $HOME/dev/tote-tocc-vin-service'                            
alias software='cd $HOME/dev/tote-tocc-softwareservice'                        
alias service='cd $HOME/dev/tote-tocc-services-ui'                          
alias notifi='cd $HOME/dev/tote-tocc-notificationservice' 
alias zos='cd $HOME/dev/tote-tocc-zos-connect' 

alias ytv='youtube-viewer'

alias wikimd="$EDITOR ~/.vimwiki/wikimd/index.md"
# }}} 

# -------- Git {{{
alias ga='git add .'
alias gc='git commit'
alias gD='git branch -D $(git branch | fzf)'
alias gd='git diff --color | diff-so-fancy'
alias gds='git diff --staged --color | diff-so-fancy'
alias gs='git status'
alias gp='git pull'
alias gps='git push'
alias gf='git fetch --all'
alias glNoGraph='git log --color=always \
--format="%C(cyan)%h%Creset %C(blue)%ar%Creset%C(auto)%d%Creset \
%C(yellow)%s%+b %C(black)%ae%Creset" "$@"'

_gitLogLineToHash="echo {} |
grep -o '[a-f0-9]\{7\}' |
head -1"

_viewGitLogLine="$_gitLogLineToHash | 
xargs -I % sh -c 'git show --color=always % | 
diff-so-fancy'"

glog() {  # search for commit with preview and copy hash
  glNoGraph |
      fzf -i -e --no-sort --reverse \
          --tiebreak=index --no-multi \
          --ansi --preview="$_viewGitLogLine" \
          --header "enter: view, M-y: copy hash" \
          --bind "enter:execute:$_viewGitLogLine   |
          less -R" \
          --bind "alt-y:execute:$_gitLogLineToHash |
          xclip -r -selection clipboard"
}

gch() {
  git checkout $(git branch -a | fzf | sed 's/remotes\/origin\///')
}
# }}}

# -------- Functions {{{
stop-umbrella() { sudo launchctl unload /Library/LaunchDaemons/com.opendns.osx.RoamingClientConfigUpdater.plist ;}
start-umbrella() { sudo launchctl load /Library/LaunchDaemons/com.opendns.osx.RoamingClientConfigUpdater.plist ;}
# }}}

# -------- Node version manager{{{
export NVM_DIR="$HOME/.config/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }}}
