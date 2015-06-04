#!/bin/bash

PS1="\u@\h:\w\$ " #simplify

REPOS="
efl
#emotion_generic_players
#evas_generic_loaders
elementary
#enlightenment
terminology
rage
"

REPOS_TMP="
"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e ${RED}"Compile and install packages${NC}"

for repo in $REPOS
do
	PROMPT_COMMAND='echo -ne "\033]0; Updating $repo \007"' #not working
	#PS1='\[\e]0;$repo\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '	
	echo -e ${GREEN}$repo${NC}
	cd $repo
	./autogen.sh
	make
	sudo make install
	sudo ldconfig
	cd ../
	echo -e	${NC}
done

# Make it only once (may be by hand)
#ln -s /usr/local/share/dbus-1/services/org.enlightenment.Ethumb.service /usr/share/dbus-1/services/org.enlightenment.Ethumb.service

#ln -s /usr/local/share/dbus-1/services/org.enlightenment.Efreet.service /usr/share/dbus-1/services/org.enlightenment.Efreet.service

exit 0

