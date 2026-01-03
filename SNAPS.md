# Remove all snaps
for snap in $(snap list | awk 'NR>1 {print $1}'); do sudo snap remove --purge "$snap"; done

# Stop and remove snapd
sudo systemctl stop snapd
sudo apt purge snapd

# Remove leftover directories
sudo rm -rf ~/snap /var/snap /var/lib/snapd /snap /etc/systemd/system/snapd.service

# Mask and disable snapd sockets (if they exist)
sudo systemctl disable snapd.socket
sudo systemctl mask snapd

# Cleanup
sudo apt autoremove
sudo apt update
