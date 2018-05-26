
# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# git prompt will be shown only when you move to a git dir
gitprompt(){
	git status &> /dev/null
	if [ "$?" == 0 ];then
		source /home/${USER}/.bashed-gitprompt.sh
	else
		# set this as your prompt for all non-git directories
		export PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}


# show our prompt.
# if the git prompt is not showing up then comment out the already existing PROMPT_COMMAND in your .bashrc
PROMPT_COMMAND="gitprompt"
