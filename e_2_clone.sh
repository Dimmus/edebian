#!/bin/bash

REPOS="http://git.enlightenment.org/core/efl.git 
http://git.enlightenment.org/core/emotion_generic_players.git 
http://git.enlightenment.org/core/evas_generic_loaders.git 
http://git.enlightenment.org/core/elementary.git 
http://git.enlightenment.org/core/enlightenment.git 
http://git.enlightenment.org/apps/terminology.git 
http://git.enlightenment.org/apps/rage.git"

for repo in $REPOS
do
	PS1='\[\e]0;$repo\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	git clone $repo
done

exit 0

