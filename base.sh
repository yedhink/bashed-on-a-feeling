
# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# git prompt will be shown only when you move to a git dir
gitprompt(){
	git status &> /dev/null
	if [ "$?" == 0 ];then
		declare -i cno=0
		source /home/${USER}/.bashed-gitprompt.sh
	else
		export PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}

PROMPT_COMMAND="gitprompt"
