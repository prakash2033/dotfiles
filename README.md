# dotfiles

  # Install packages
  ```
  sudo apt install zoxide pipx wl-clipboard tmux zsh zsh-syntax-highlighting git stow coreutils xdotool sxiv \
  cmus jq fzf dmenu qpdfview task-spooler xcb libxcb-util0-dev libxcb-cursor-dev \
  python3-pip python-is-python3 w3m surfraw feh onedrive ranger imagemagick aptitude lynx \
  libxext-dev gvfs-backends fortunes fortunes git stow vim vim-gtk3 chafa screenkey gnome-weather \
  btop mpv -y
  ```

  ```
  pip3 install ueberzug
  ```

  # Bluetooth Apps
  ```
  bluez blueman
  ```
  
  # Newsboat
  ```
  sudo apt install libsqlite3-dev sqlite3 libcurl4-openssl-dev libxml2-dev cargo libjson-c-dev libncursesw5-dev sqlite3 libstfl-dev \
  asciidoctor libjson-c-dev libncursesw5-dev libssl-dev libcrypto++-dev -y
  
  cd /tmp
  git clone https://github.com/newsboat/newsboat.git
  cd newsboat
  sed -i 's/PanicHookInfo/PanicInfo/g' rust/libnewsboat/src/human_panic.rs
  make -j8 && sudo make install #  pass -jN to use N CPU cores, e.g. -j8
  
  (crontab -l | grep -Fxq "0 */2 * * * /usr/local/bin/newsboat -x reload" || (crontab -l; echo "0 */2 * * * /usr/local/bin/newsboat -x reload")) | crontab -
  ```
  
  # RTV - Terminal for Reddit [Python3.8](https://askubuntu.com/a/1503634/1004133)
  ```
  sudo dnf groupinstall "Development Tools"
  sudo dnf install ncurses-devel openssl-devel libffi-devel bzip2-devel zlib-devel readline-devel sqlite-devel
  wget https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tgz
  tar -xf Python-3.8.16.tgz
  cd Python-3.8.16
  ./configure --with-ssl --enable-optimizations 
  make -j$(nproc)
  sudo make install
  python3.8 -m venv ~/.myenv3.8
  cd ~/.myenv3.8/bin
  ./pip install rtv
  sudo mv $(which python3.8)  ~/.myenv3.8/bin/
  ```
  
 # Dotool - Mouse and Keyboard Input everywhere (X11/Wayland/TTY)
 ```
 sudo apt install build-essential libevdev-dev libudev-dev golang-go scdoc
 git clone https://git.sr.ht/~geb/dotool
 cd dotool
 ./build.sh && sudo ./build.sh install
 sudo udevadm control --reload && sudo udevadm trigger
 ```
 
  ## Google Chrome
  ```
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  ```
  ## VS Code
  ```
  wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode.deb
  sudo dpkg -i vscode.deb
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
  gh extension install github/gh-copilot
  gh auth login
  ```
  
  ## Dev Cli
  ```
  curl -sS https://webinstall.dev/k9s | bash
  ```
  
  ## Chatgpt, Shell Gpt Cli & Ollama
  ```
  curl -L -o chatgpt https://github.com/kardolus/chatgpt-cli/releases/latest/download/chatgpt-linux-amd64 && chmod +x chatgpt && sudo mv chatgpt /usr/local/bin/
  pipx install shell-gpt
  sgpt --install-integration
  
  curl -fsSL https://ollama.com/install.sh | sh
  ```
  
  ## Gogh Colorscheme
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
  sudo apt install adwaita-icon-theme-full
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize-or-previews
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
  gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
  gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
  ```
  
  # Development setup
  ```
  wget https://dot.net/v1/dotnet-install.sh
  chmod +x dotnet-install.sh
  ./dotnet-install.sh --channel LTS
  ./dotnet-install.sh --channel 7.0

  dotnet tool update -g linux-dev-certs
  dotnet linux-dev-certs install
  
  dotnet dev-certs https --clean
  dotnet dev-certs https --trust
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
  git clone git@github.com:prakash2033/wiki.git  
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
