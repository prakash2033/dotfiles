# feh set wallpaper
feh --no-fehbg --bg-scale '/home/prakash/Pictures/linux_penguin.jpeg' 

if [ -f "$HOME/.xprofile" ]; then 
	. "$HOME/.xprofile" 
fi

# start ssh-agent and window mamager
# start slstatus bar
/usr/local/bin/slstatus &
exec ssh-agent /usr/local/bin/dwm
