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
: ${commits_total:=''} # or you can try f737 with a nerd font
: ${added_but_not_pushed:=''}
: ${committed_but_not_pushed:=''}
: ${no_of_files_to_be_pushed:=''}
: ${committed_but_modified_before_push:=''}
: ${untracked_files:=''}
: ${gitprompt_icon:=''}

read a_but_not_c c_but_not_p c_but_m_before_p untracked <<< $( echo | xargs -n 1 -P 8 bash ~/.cal.sh )
echo $a_but_not_c $c_but_not_p $c_but_m_before_p $untracked
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
# Create a string
printf -v PS1RHS "\e[0m \e[0;1;31m%s %s %s %s %s\e[0m" "$gbranch" "$a_but_not_c" "$c_but_not_p" "$c_but_m_before_p" "$untracked"

# Strip ANSI commands before counting length
PS1RHS_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"$PS1RHS")
