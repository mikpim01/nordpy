#!/bin/bash

#install dependencies and add desktop Entry

if ! [ -z `which apt-get 2> /dev/null` ]; # Debian
    then sudo apt-get install python python-tkinter python-requests openvpn wget unzip 2> /dev/null
fi
if ! [ -z `which dnf 2> /dev/null` ]; # Fedora
    then sudo dnf install python python-tkinter python-requests openvpn wget unzip 2> /dev/null
fi
if ! [ -z `which pacman 2> /dev/null` ]; # Arch Linux
    then sudo pacman install python python-tkinter python-requests openvpn wget unzip 2> /dev/null
fi

current_dir=`pwd`

echo "[Desktop Entry]

Type=Application
Version=1.0
Name=NordPy
Comment=NordVPN client application for connecting to recommended servers
Path="$current_dir"
Exec=python3 "$current_dir"/nordpy.py
Icon="$current_dir"/media/nordvpn.png
Terminal=false
Categories=Internet;System;Utilities;" | sudo tee /usr/local/share/applications/nordpy.desktop > /dev/null

sudo chmod 0777 /usr/local/share/applications/nordpy.desktop


# downloading and extracting conf files from NordVPN
cd /etc/openvpn
sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
sudo unzip ovpn.zip
sudo rm ovpn.zip