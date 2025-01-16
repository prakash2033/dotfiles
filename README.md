# dotfiles

    # Install packages
    sudo apt install zoxide pipx wl-clipboard xterm tmux zsh zsh-syntax-highlighting -y
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
    sudo apt install git stow 
    sudo apt install mpv
    pip3 install ueberzug
    
    # Compile newsboat
    sudo apt-get install sqlite3 libcurl4-openssl-dev libxml2-dev cargo libjson-c-dev libncursesw5-dev
    sudo apt install sqlite3 libstfl-dev asciidoctor libjson-c-dev libncursesw5-dev libssl-dev libcrypto++-dev
    
    ## Google Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp

    mkdir -p ~/Public/gitrepo 
    cd ~/Public/gitrepo
    git clone https://github.com/prakash2033/dotfiles_v2.git
    git clone https://github.com/so-fancy/diff-so-fancy.git
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/prakash2033/shownotes.git
    git clone https://github.com/michael-lazar/rtv.git
    
    # Gogh Colorscheme
    sudo apt-get install dconf-cli uuid-runtime
    bash -c "$(wget -qO- https://git.io/vQgMr)"
    
    # change to zsh shell
    chsh -s /usr/bin/zsh
    
    # install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # install git & stow
    sudo apt install git stow
    sudo apt install git stow vim vim-gtk3
    
    # remove last login on terminal start
    touch ~/.hushlogin
    
    # install mov-cli
    pipx install mov-cli
    pipx inject mov-cli mov-cli-youtube
    mov-cli -e
    sudo apt install chafa # for video previews
    
    # Auto-cpufreq
    git clone https://github.com/AdnanHodzic/auto-cpufreq.git
    cd auto-cpufreq && sudo ./auto-cpufreq-installer
    ## Install daemon
    sudo auto-cpufreq --install     
    auto-cpufreq --stats
    
    # Github Cli
    sudo apt install gh
    gh auth login
    gh extension install github/gh-copilot 
    
    # Chatgpt Cli
    curl -L -o chatgpt https://github.com/kardolus/chatgpt-cli/releases/latest/download/chatgpt-linux-amd64 && chmod +x chatgpt && sudo mv chatgpt /usr/local/bin/
    
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
