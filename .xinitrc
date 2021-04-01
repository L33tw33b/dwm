#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f

fi

#Faster key repeat and delay
xset r rate 210 40

#Display resolution
xrandr --output Virtual1 --mode 1280x800 &

#Loop for automatically starting dwm after editing config.def.h

#Dwm statusbar
~/dwm-bar/dwm_bar.sh &

#Compositor
picom -f --no-vsync &

#Wallpaper
nitrogen --restore &

#Execute dwm
exec dwm

	
