# -------- Exports {{{
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_CONFIG_DIR="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share" 
export FZF_DEFAULT_COMMAND='find .'
export BROWSER="xdg-open"
export BROWSER_PRIVATE="flatpak run org.chromium.Chromium --incognito"
export EDITOR='vim'
export BROWSERCLI="w3m" 
export LYNX_CFG="~/.config/lynx/lynx.cfg"
export URLPORTAL=~/.scripts/urlportal
export RTV="rtv"
export RTV_BROWSER=$URLPORTAL 
export IMAGEVIEWER="feh" 
export IMAGECLI="feh"
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export SSL_CERT_DIR="~/.dotnet/corefx/cryptography/x509stores/my"
export LESS=$LESS" -S -R"
export TERM="xterm-256color"
export LIBVIRT_DEFAULT_URI='qemu:///system'
# export GSETTINGS_BACKEND=keyfile
export KUBE_EDITOR="vim"
# export GTK_THEME_PREFER_DARK=1
# export GTK_USE_PORTAL=1

#commented below line, it breaks kde plasma
#export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share 

## custom w3m hotkeys
export W3M_HOTKEY_OPTIONS=':O'
export W3M_HOTKEY_LINK_BEGIN='f'
export W3M_HOTKEY_RELOAD='r'
# }}}

# -------- PATHS {{{
[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH" 
[ -d "/usr/sbin" ] && PATH="/usr/sbin:$PATH"
[ -d "$HOME/Public/gitrepo/diff-so-fancy" ] && PATH="$HOME/Public/gitrepo/diff-so-fancy:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/share/JetBrains/Toolbox/apps/rider/bin" ] && PATH="$HOME/.local/share/JetBrains/Toolbox/apps/rider/bin:$PATH"
[ -d "$HOME/.dotnet" ] && PATH="$HOME/.dotnet:$PATH"
[ -d "$HOME/.dotnet/tools" ] && PATH="$HOME/.dotnet/tools:$PATH"
[ -d "/home/linuxbrew/.linuxbrew/bin" ] && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

[ -f "$HOME/.env" ] && source "$HOME/.env"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# }}}

# -------- Perl for YouTube-Viewer {{{    
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;                                                                                                   
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;    
# }}} 

# -------- XINITRC {{{
#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg > /dev/null 2>&1 && exec startx $HOME/.xinitrc
# }}}
