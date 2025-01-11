# dotfiles

    # Install packages
    sudo apt install xterm tmux zsh zsh-syntax-highlighting -y
    sudo apt install git stow coreutils xdotool sxiv cmus htop newsboat -y
    sudo apt install jq fzf dmenu qpdfview task-spooler -y
    sudo apt install xcb libxcb-util0-dev libxcb-cursor-dev -y
    sudo apt install python3-pip python-is-python3 -y
    sudo apt install w3m surfraw rtv feh -y
    sudo apt install onedrive ranger imagemagick aptitude lynx -y
    sudo apt install bluez blueman -y
    sudo apt install libxext-dev -y
    sudo apt install gvfs-backends -y # for sambha share support in thunar file manager
    sudo apt install fortunes fortunes ## for random quotes
    sudo apt install mpv
    pip3 install ueberzug
    
    ## Google Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp

    # install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # install git & stow
    brew install git stow
    sudo apt install git stow vim vim-gtk3
    
    # remove last login on terminal start
    touch ~/.hushlogin
    
    # vim plug install. Run :PlugInstall inside vim. Install vim-gtk aka gvim in linux
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    ## clone repo
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
