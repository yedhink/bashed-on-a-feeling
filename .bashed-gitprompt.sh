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

# # # # # # # # # # # #
# set your icons here #
# # # # # # # # # # # #
: ${commiticon:=''} # or you can try f737 with a nerd font
: ${added_but_not_committed:=''}
: ${committed_and_clean:=''}
: ${no_of_files_to_be_pushed:=''}
: ${committed_but_modified_before_push:=''}
: ${untracked_files:=''}
: ${gitprompt_icon:=''}

read a_but_not_c c_but_not_p c_but_m_before_p untracked gbranch commitstot<<< $( echo | xargs -n 1 -P 8 ~/.cal.sh )

echo "$commitstot"
#while read -ra Z; do
#	if [[ "${Z[@]}" == \*\ * ]]; then
#		gbranch="${Z[1]}"
#		break
#	fi
#done <<< "$(/usr/bin/git branch 2> /dev/null)"
#gbranch=`tput bold; tput setaf 7 ;echo "$gbranch"`
#
#
#while read -r Z; do
#	[[ "$Z" == commit* ]] && cno+=1
#done <<< "$(/usr/bin/git log 2> /dev/null)"
#commitstot=$cno

if [ $a_but_not_c -eq 0 ];then
	a_but_not_c=""
else
	a_but_not_c="$(tput bold)$(tput setaf 7)$a_but_not_c$(tput bold)$(tput setaf 2)$(echo $added_but_not_committed)"
fi

if [ $c_but_not_p -gt 0 ];then
	((c_but_not_p = c_but_not_p - 1 ))
fi

if [ $c_but_not_p == 0 ];then
	c_but_not_p="$(tput bold)$(tput setaf 2)$(echo $committed_and_clean)"
else
	c_but_not_p="$(tput bold)$(tput setaf 7)$c_but_not_p$(tput bold)$(tput setaf 2)$(echo $no_of_files_to_be_pushed)"
fi

if [ $c_but_m_before_p -eq 0 ];then
	c_but_m_before_p=""
else
	c_but_m_before_p="$(tput bold)$(tput setaf 7)$c_but_m_before_p$(tput bold)$(tput setaf 2)$(echo $committed_but_modified_before_push)"
fi

if [ $untracked -eq 0 ];then
	untracked=""
else
	untracked="$(tput bold)$(tput setaf 7)$untracked$(tput bold)$(tput setaf 2)$(echo $untracked_files)"
fi
# Create a string
printf -v PS1RHS "\e[0m \e[0;1;31m%s %s %s %s %s\e[0m" "$gbranch" "$a_but_not_c" "$c_but_not_p" "$c_but_m_before_p" "$untracked"

# Strip ANSI commands before counting length
PS1RHS_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"$PS1RHS")
local Save='\e[s' # Save cursor position
local Rest='\e[u' # Restore cursor to save point

# bashed-git-prompt \m/
PS1='\[\e[1;33;3m\]\w \[\e[0m\]$(tput setaf 2)$(tput bold)$commitstot $commiticon\n $(tput setaf 7)$(tput bold)$(tput setab 4) $gitprompt_icon\[\e[0m\] '
export PS1="\[${Save}\e[${COLUMNS}C\e[${#PS1RHS_stripped}D${PS1RHS}${Rest}\]${PS1}"
