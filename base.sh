
# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# git prompt will be shown only when you move to a git dir
gitprompt(){
	git status &> /dev/null
	if [ "$?" == 0 ];then
		source /home/${USER}/.bashed-gitprompt.sh
		declare -i cno=0
		local Save='\e[s' # Save cursor position
		local Rest='\e[u' # Restore cursor to save point

		PS1='\[\e[1;33;3m\]\w \[\e[0m\]$(tput setaf 2)$(tput bold)$commitstot $commiticon\n $(tput setaf 7)$(tput bold)$(tput setab 4) \[\e[0m\] '
		export PS1="\[${Save}\e[${COLUMNS}C\e[${#PS1RHS_stripped}D${PS1RHS}${Rest}\]${PS1}"
	else
		# set this as your prompt for all non-git directories
		export PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}


# show our prompt.
# if the git prompt is not showing up then comment out the already existing PROMPT_COMMAND in your .bashrc
PROMPT_COMMAND="gitprompt"
