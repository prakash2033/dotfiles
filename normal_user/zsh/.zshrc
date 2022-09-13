alias ls='ls --color'
autoload -U colors && colors
export PS1="%{$fg[green]%}%n@%m %{$fg[blue]%}%~ %{$fg[green]%}$ %{$reset_color%}"
setopt autocd   # Automatically cd into typed directory.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load syntax highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Load zsh autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

fzf-history-widget() {
  local selected
  if selected=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -q "$LBUFFER" +s -e -i --tac --height 10% | sed 's/ *[0-9]* *//' ); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget


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
alias label='cd $HOME/dev/tote-tocc-labelservice'                            
alias vin='cd $HOME/dev/tote-tocc-vin-service'                            
alias software='cd $HOME/dev/tote-tocc-softwareservice'                        
alias service='cd $HOME/dev/tote-tocc-services-ui'                          
alias notifi='cd $HOME/dev/tote-tocc-notificationservice' 

alias ytv='youtube-viewer'

alias wikimd="$EDITOR ~/.vimwiki/wikimd/index.md"
# }}} 

# -------- Git {{{
alias ga='git add .'
alias gc='git commit'
alias gch='git checkout $(git branch | fzf)'
alias gD='git branch -D $(git branch | fzf)'
alias gd='git diff --color | diff-so-fancy'
alias gds='git diff --staged --color | diff-so-fancy'
alias gs='git status'
alias gp='git pull'
alias gps='git push'
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
# }}}
