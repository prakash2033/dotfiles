# dotfiles

    # apps
    sudo apt install curl stow git
    sudo apt install vim-gtk3 # run :echo has('clipboard') in vim to check if +clipboard available
    sudo apt install sassc gettext # for compiling pop os gtk theme
    
    sudo apt install fonts-noto-color-emoji dconf-editor gnome-shell-extensions chrome-gnome-shell- acpi xclip
    sudo apt install -y libssl-dev libffi-dev python3-dev build-essential
    
    sudo apt install zsh zsh-syntax-highlighting
    chsh -s /usr/bin/zsh
    
    # zsh autosuggestions
    echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
    curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
    sudo apt update
    sudo apt install zsh-autosuggestions
    
    # vim plug install. Run :PlugInstall inside vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    # Clone repo
    mkdir -p ~/Public/gitrepo 
    cd ~/Public/gitrepo
    git clone https://github.com/prakash2033/dotfiles.git
    
    ## symlink all folders (trailing slash */) in dotfiles dir to home dir
    cd ~/Public/gitrepo/dotfiles/normal_user
    stow -v -t ~ */

    ## if new folder is added then:
    # redo link (-R)
    cd ~/Public/gitrepo/dotfiles/normal_user
    stow -v -R -t ~ */
    stow -v -R -t ~ tmux
    
    ## if folder was deleted then:
    # delete (-D flag then -R to relink)
    cd ~/Public/gitrepo/dotfiles/normal_user
    stow -v -D -t ~ */
    stow -v -R -t ~ */
