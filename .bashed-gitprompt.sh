#!/bin/bash

#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ ikigai
# ░▓ code   ▓ https://github.com/yedhink/dotfiles_ikigai
# ░▓ 	    ▓
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
# this is a custom prompt that i made when i started struggling with maintaining my repos and was not able to find a git-prompt of my liking
# FEATURES :
#	  MINAMILISTIC CHECK
#	  INFORMATIVE  CHECK
#	  FAST         CHECK
#
#  "ahh..ahh..ah..bashed-on-a-feeling!"
#
# set your preferred icons here
ocu=`printf "%b" " "`

read a_but_not_c c_but_not_p c_but_m_before_p untracked <<< $( echo | xargs -n 1 -P 8 ~/dotfiles_ikigai/scripts/blah/para.sh )

while read -ra Z; do
	if [[ "${Z[@]}" == \*\ * ]]; then
		gbranch="${Z[1]}"
		break
	fi
done <<< "$(/usr/bin/git branch 2> /dev/null)"
gbranch=`tput bold; tput setaf 7 ;echo "$gbranch"`


while read -r Z; do
	[[ "$Z" == commit* ]] && cno+=1
done <<< "$(/usr/bin/git log 2> /dev/null)"
commitstot=$cno
commiticon="\\uf737"
commiticon=`printf "%b\\n" "$commiticon"`

if [ $a_but_not_c -eq 0 ];then
	a_but_not_c=""
else
	a_but_not_c="$(tput bold)$(tput setaf 7)$a_but_not_c$(tput bold)$(tput setaf 2)"
fi

if [ $c_but_not_p -gt 0 ];then
	((c_but_not_p = c_but_not_p - 1 ))
fi

if [ $c_but_not_p == 0 ];then
	c_but_not_p="$(tput bold)$(tput setaf 2)"
else
	c_but_not_p="$(tput bold)$(tput setaf 7)$c_but_not_p$(tput bold)$(tput setaf 2)"
fi

if [ $c_but_m_before_p -eq 0 ];then
	c_but_m_before_p=""
else
	c_but_m_before_p="$(tput bold)$(tput setaf 7)$c_but_m_before_p$(tput bold)$(tput setaf 2)"
fi

if [ $untracked -eq 0 ];then
	untracked=""
else
	untracked="$(tput bold)$(tput setaf 7)$untracked$(tput bold)$(tput setaf 2)"
fi

