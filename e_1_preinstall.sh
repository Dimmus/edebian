#!/bin/bash

PS1="\u@\h:\w\$ "

REPOS="
clang gettext make autoconf automake autopoint libtool check
libpam-dev 
libfreetype6-dev
libpng-dev
libjpeg-dev
zlib1g-dev
libdbusmenu-glib-dev
libdbusmenu-gtk3-dev
libdbusmenu-jsonloader-dev
libdbusmenu-qt-dev
libluajit-5.1-dev
libx11-dev
libxcursor-dev
libxrender-dev
libxrandr-dev
libxfixes-dev
libxdamage-dev
libxcomposite-dev
libxss-dev
libxp-dev
libxext-dev
libxinerama-dev
libxkbfile-dev
libxtst-dev
libxcb1-dev
libxcb-util0-dev
libxcb-keysyms1-dev
libpulse-dev
libsndfile-dev
libudev-dev
libc6-dev
libgstreamer1.0-dev
libgstreamer-plugins-base1.0-dev
libvlc-dev
libtiff-dev
libgif-dev
curl
libssl-dev
libgl1-mesa-dev
libspectre-dev
libpoppler-dev
librsvg2-dev
libraw-dev
libxine2-dev
doxygen
libfribidi-dev
libmount-dev
libbullet-dev
git
"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "Installing nessesary ${RED}LIBS ${NC}and ${RED}UTILS ${NC}for compilation:"

for repo in $REPOS
do
	PROMPT_COMMAND='echo -ne "\033]0; Updating $repo \007"'
	PS1='\[\e]0;$repo\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '	
	echo -e ${GREEN}$repo":"${NC}
	sudo apt-get -y install $repo
	sudo ldconfig
	echo -e ${NC}""
done

exit 0

