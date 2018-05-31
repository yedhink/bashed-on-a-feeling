
# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# git prompt will be shown only when you move to a git dir
gitprompt(){
	
    if `git status &> /dev/null`; then
		declare -i cno=0
		source ~/.bashed-gitprompt.sh
	else
		export PS1='\[\e[0;31m\]♥ \[\e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}

PROMPT_COMMAND="gitprompt"
