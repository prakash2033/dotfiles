export NVM_DIR="$HOME/.nvm"
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share" 
export BROWSER="chromium" 
export EDITOR='vim'
export BROWSERCLI="w3m" 
export URLPORTAL=~/.scripts/urlportal 
export RTV_BROWSER=$URLPORTAL 
export IMAGEVIEWER="feh" 
export IMAGECLI="feh"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH" 
