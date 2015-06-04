#!/bin/bash

REPOS="efl 
emotion_generic_players 
evas_generic_loaders 
elementary 
enlightenment 
terminology 
rage"

RED='\033[0;32m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e ${RED}"Updating ..."${NC}

for repo in $REPOS
do
	cd $repo
	echo -e ${GREEN}$repo${NC}
	git pull origin master
	echo -e ${NC}""
	cd ../
done

exit 0

