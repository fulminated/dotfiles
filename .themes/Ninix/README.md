Ninix is based on Numix

Numix is a modern flat theme with a combination of light and dark elements. It supports Gnome, Unity, XFCE and Openbox.

Numix is a part of the [Numix Project](http://numixproject.org).

### Manual installation

Extract the zip file to the themes directory i.e. `/usr/share/themes/`

To set the theme in Gnome, run the following commands in Terminal,

```
gsettings set org.gnome.desktop.interface gtk-theme "Ninix"
gsettings set org.gnome.desktop.wm.preferences theme "Ninix"
```

To set the theme in Xfce, run the following commands in Terminal,

```
xfconf-query -c xsettings -p /Net/ThemeName -s "Ninix"
xfconf-query -c xfwm4 -p /general/theme -s "Ninix"
```

### Requirements

GTK+ 3.6 or above

Murrine theme engine

### Code and license

Report bugs or contribute at [GitHub](https://github.com/shimmerproject/Numix)

License: GPL-3.0+
