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

# infinitely do this loop thingy
while true; do

  # changes up the dwm statusbar to be more epic
  # the cat command pulls up the battery percentage
  # the date command shows weekday, month, day of week, year, 24 hour time, and timezone.
  # Shows in HH:MM
  # The icons are from fontawesome so you may need to get that
  xsetroot -name "   $(cat /sys/class/power_supply/BAT0/capacity)% |  $(date +"%A, %B %d, %Y | %k:%M %Z")"
  sleep 5s       # update every 5 seconds
done &

# nitrogen command loads last used wallpaper (requires nitrogen)
# xcompmgr loads my compositor (requires xcompmgr)
# exec dwm starts dwm
nitrogen --restore &
xcompmgr &
exec dwm
