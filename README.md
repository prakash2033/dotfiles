# dotfiles

  # Install packages
  ```
  sudo apt install zoxide pipx wl-clipboard xterm tmux zsh zsh-syntax-highlighting git stow coreutils xdotool sxiv \
  cmus htop jq fzf dmenu qpdfview task-spooler xcb libxcb-util0-dev libxcb-cursor-dev \
  python3-pip python-is-python3 w3m   surfraw feh onedrive ranger imagemagick aptitude lynx bluez blueman \
  libxext-dev gvfs-backends fortunes fortunes git stow vim vim-gtk3 chafa screenkey -y
  ```

  ```
  pip3 install ueberzug
  ```
  
  # Newsboat dependencies
  ```
  sudo apt install sqlite3 libcurl4-openssl-dev libxml2-dev cargo libjson-c-dev libncursesw5-dev sqlite3 libstfl-dev \
  asciidoctor libjson-c-dev libncursesw5-dev libssl-dev libcrypto++-dev
  ```
  
 # Dotool - Mouse and Keyboard Input everywhere (X11/Wayland/TTY)
 ```
 sudo apt install build-essential libevdev-dev libudev-dev golang-go scdoc
 git clone https://git.sr.ht/~geb/dotool
 cd dotool
 ./build.sh && sudo ./build.sh install
 sudo udevadm control --reload && sudo udevadm trigger
 ```
  
  # RTV - Terminal for Reddit [Python3.8](https://askubuntu.com/a/1503634/1004133)
  ```
  git clone https://github.com/michael-lazar/rtv.git
  cd rtv
  python setup.py install
  ```
  
  ## Google Chrome
  ```
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  ```
  
  ## Youtube-dl
  ```
  sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
  sudo chmod a+rx /usr/local/bin/yt-dlp
  ```
  
  ## Github Cli
  ```
  ssh-keygen -b 2048 -t rsa
  sudo apt install gh
  gh auth login
  gh extension install github/gh-copilot
  ```
  
  ## Chatgpt Cli
  ```
  curl -L -o chatgpt https://github.com/kardolus/chatgpt-cli/releases/latest/download/chatgpt-linux-amd64 && chmod +x chatgpt && sudo mv chatgpt /usr/local/bin/
  ```
  
  ## Gogh Colorscheme (Run from outside tmux)
  ```
  sudo apt-get install dconf-cli uuid-runtime
  bash -c "$(wget -qO- https://git.io/vQgMr)"
  ```
  
  # change to zsh shell
  ```
  chsh -s /usr/bin/zsh
  ```
  
  # install brew
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  
  # install mov-cli
  ```
  pipx install mov-cli
  pipx inject mov-cli mov-cli-youtube
  mov-cli -e
  ```
  
  # Auto-cpufreq
  ```
  git clone https://github.com/AdnanHodzic/auto-cpufreq.git
  cd auto-cpufreq && sudo ./auto-cpufreq-installer
  ## Install daemon
  sudo auto-cpufreq --install     
  auto-cpufreq --stats
  ```
  
  # Ubuntu Specific Customization
  ```
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize-or-previews
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
  gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
  ```

  ## clone repo
  ```
  mkdir -p ~/Public/gitrepo 
  cd ~/Public/gitrepo
  git clone https://github.com/prakash2033/dotfiles_v2.git
  git clone https://github.com/so-fancy/diff-so-fancy.git
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  git clone https://github.com/prakash2033/shownotes.git
  git clone https://github.com/michael-lazar/rtv.git
  git clone git@github.com:prakash2033/dotfiles.git
  ```

  ## symlink all folders (trailing slash */) in dotfiles dir to home dir
  ```
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
  ```
