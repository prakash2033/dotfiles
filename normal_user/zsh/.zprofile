export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share" 
export BROWSER="chromium" 
export EDITOR='vim'
export BROWSERCLI="w3m" 
export URLPORTAL=~/.scripts/urlportal 
export RTV_BROWSER=$URLPORTAL 
export IMAGEVIEWER="feh" 
export IMAGECLI="feh"
export NVM_DIR="$HOME/.nvm"
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export LESS=$LESS" -S"
export TERM="screen-256color"

## custom w3m hotkeys
export W3M_HOTKEY_OPTIONS=':O'
export W3M_HOTKEY_LINK_BEGIN='f'
export W3M_HOTKEY_RELOAD='r'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH" 
[ -d "/usr/sbin" ] && PATH="/usr/sbin:$PATH"
[ -d "$HOME/Public/gitrepo/diff-so-fancy" ] && PATH="$HOME/Public/gitrepo/diff-so-fancy:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.dotnet" ] && PATH="$HOME/.dotnet:$PATH"
[ -d "$HOME/.dotnet/tools" ] && PATH="$HOME/.dotnet/tools:$PATH"

# -------- Perl for YouTube-Viewer {{{    
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;                                                                                                   
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;    
# }}} 
