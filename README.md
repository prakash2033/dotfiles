# dotfiles

  # Install packages
  ```
  sudo apt install curl zoxide pipx wl-clipboard tmux zsh zsh-syntax-highlighting git stow coreutils xdotool  \
  cmus jq fzf dmenu qpdfview task-spooler xcb libxcb-util0-dev libxcb-cursor-dev \
  python3-pip python-is-python3 w3m imagemagick lynx \
  libxext-dev gvfs-backends git stow vim vim-athena chafa screenkey cliphist fonts-cantarell \
  btop mpv zathura dnsutils tree fuse fastfetch fortunes tty-clock cowsay lolcat pipes-sh cbonsai cmatrix -y
  sudo apt install polkit-kde-agent-1
  sudo apt install policykit-1-gnome
  sudo apt install --install-recommends dolphin
  
  sudo apt install brightnessctl
  sudo usermod -aG netdev,video,input $USER
  ```

  ## Installing niri dependencies
  ```
  sudo apt install xdg-desktop-portal-wlr xdg-desktop-portal-gnome xdg-desktop-portal-gtk swaybg sxiv
  sudo apt-get install -y gcc clang libudev-dev libgbm-dev libxkbcommon-dev libegl1-mesa-dev libwayland-dev \
libinput-dev libdbus-1-dev libsystemd-dev libseat-dev libpipewire-0.3-dev libpango1.0-dev libdisplay-info-dev
  sudo apt install waybar fuzzel mako-notifier swaybg swayidle swaylock slurp grim meson scdoc

  ###Add to .zshenv
  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
  export SSL_CERT_DIR=/etc/ssl/certs

  curl https://sh.rustup.rs -sSf | sh
  ```
  
  ### Building from [source](https://niri-wm.github.io/niri/Getting-Started.html#manual-installation)
  ```
  git clone https://github.com/niri-wm/niri.git
  cargo build --release

  sudo cp target/release/niri /usr/local/bin/
  
  #
  sudo cp resources/niri-session /usr/local/bin/
  sudo cp resources/niri.desktop /usr/local/share/wayland-sessions/
  sudo cp resources/niri-portals.conf /usr/local/share/xdg-desktop-portal/
  sudo cp resources/niri.service /etc/systemd/user/
  sudo cp resources/niri-shutdown.target /etc/systemd/user/
  
  
  # if dinit system
  sudo cp resources/dinit/niri /etc/dinit.d/user/
  sudo cp resources/dinit/niri.target /etc/dinit.d/user/

  touch ~/.config/niri/outputs.kdl.local
  touch ~/.local/ghostty/config.local
  
  sudo install -m 755 target/release/niri /usr/local/bin/niri
  ```
  
  ## Install thunar
  ```
  sudo apt install thunar gvfs gvfs-backends udisks2 tumbler thunar-archive-plugin file-roller
  ```
  
  ## Install wiremix, bluetui
  ```
  sudo apt install cargo libpipewire-0.3-dev pkg-config clang
  cargo install wiremix bluetui
  ```

  ## swaylock-effects
  ```
  git clone https://github.com/mortie/swaylock-effects.git
  cd swaylock-effects
  meson build
  ninja -C build
  sudo ninja -C build install
  ```
  ## Install gnu-screen-recorder
  ```
  sudo bash -c "$(wget -q https://pacstall.dev/q/install -O -)" 
  pacstall -I gpu-screen-recorder
  ``` 
  
  ## Install music daemon and player
  ```
  sudo apt install mpd mpc ncmpcpp
  cargo install rmpc --locked
  ```
  
  ## Dconf backup and restore
  ```
  dconf dump / > ~/Public/gitrepo/dotfiles/normal_user/dconf/.config/dconf-backup.ini
  dconf load /org/gnome/ < ~/Public/gitrepo/dotfiles/normal_user/dconf/.config/dconf-backup.ini
  ``` 
  
  ## Install Fonts: sans-serif and ms fonts
  ```
  sudo apt install fonts-dejavu fonts-liberation fonts-noto
  sudo apt install ttf-mscorefonts-installer
  ```
  
  ## Extras
  ```
  sudo apt install sxiv vim-gtk3 surfraw feh onedrive ranger aptitude 
  sudo apt install gnome-weather gnome-shell-extension-manager gnome-tweaks gnome-boxes
  sudo apt install fonts-ubuntu-classic
  pip3 install ueberzug
  ```
  ## For Cisco Secure client - you're missing the required libraries for the authentication method you requested
  ```
  sudo apt install libwebkit2gtk-4.1-0
  ```

  # Bluetooth Apps
  ```
  bluez blueman
  ```

  # Papirus
  ```
  sudo add-apt-repository ppa:papirus/papirus
  sudo apt install papirus-icon-theme
  papirus-folders -C black
  ```

  # Antivirus
  `sudo apt-get install clamav` # clamscan filename, sudo freshclam - update virus definitions, clamav-freshclam.service runs automatically
  
  # Newsboat
  ```
  sudo snap install newsboat
  ln -s -r ~/.newsboat ~/snap/newsboat/8579/.newsboat

  OR

  sudo apt install libsqlite3-dev sqlite3 libcurl4-openssl-dev libxml2-dev cargo libjson-c-dev libncursesw5-dev sqlite3 libstfl-dev \
  asciidoctor libjson-c-dev libncursesw5-dev libssl-dev libcrypto++-dev -y
  
  cd /tmp
  git clone https://github.com/newsboat/newsboat.git
  cd newsboat
  sudo apt-get install pkg-config
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
  
  "Global install
  python3.8 -m pip install --upgrade pip
  python3.8 -m pip install setuptools
  python3.8 -m pip install rtv
  
  "Alternative install
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
 
  ## Install Ghostty
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
  ```
 
  ## Google Chrome & Brave Browser
  ```
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  chrome://settings/content/pdfDocuments

  curl -fsS https://dl.brave.com/install.sh | sh
  ```
  ## 1Password
  ```
  sudo apt install gnupg2
  wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
  sudo dpkg -i 1password-latest.deb
  ```

  ## VS Code
  ```
  wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode.deb
  sudo dpkg -i vscode.deb
  ```
  
  ## Discord
  ```
  wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
  sudo apt install ./discord.deb
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
  
  ## Dev Cli
  ```
  curl -sS https://webinstall.dev/k9s | bash
  sudo apt install kubectx
  ```
  
  ## Chatgpt, Shell Gpt Cli & Ollama
  ```
  curl -L -o chatgpt https://github.com/kardolus/chatgpt-cli/releases/latest/download/chatgpt-linux-amd64 && chmod +x chatgpt && sudo mv chatgpt /usr/local/bin/
  pipx install shell-gpt
  sgpt --install-integration
  
  curl -fsSL https://ollama.com/install.sh | sh
  ollama pull mistral:7b-instruct
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
  gsettings set org.gnome.shell.window-switcher current-workspace-only false
  gsettings set org.gnome.desktop.interface clock-show-seconds true
  ```

  # Install [slurp](https://github.com/emersion/slurp) for interactive screenshot along with grim and [satty](https://github.com/Satty-org/Satty/tree/main)
  ```
  git clone https://github.com/emersion/slurp
  cd slurp
  meson setup build
  ninja -C build
  build/slurp
  ```

  # Install satty
  ```
  sudo apt install libgtk-4-dev libadwaita-1-dev pkg-config
  git clone https://github.com/Satty-org/Satty
  # build release binary, located in ./target/release/satty
  make build-release

  # optional: install to /usr/local
  PREFIX=/usr/local make install
  ```
  
  # Development setup
  ```
  wget https://dot.net/v1/dotnet-install.sh
  chmod +x dotnet-install.sh
  ./dotnet-install.sh --channel LTS
  ./dotnet-install.sh --channel 7.0

  source ~/.zprofile # export PATH="$PATH:/home/pvishwa1/.dotnet/tools" 
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
