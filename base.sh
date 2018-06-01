
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# NOTE THAT THE TERMINAL COLORS WOULD VARY DEPENDING ON YOUR TERMINAL PALETTE
# Regular Colors Available In Your Terminal
Black="$(tput bold)$(tput setaf 0)"    # Black
Red="$(tput bold)$(tput setaf 1)"      # Red
Green="$(tput bold)$(tput setaf 2)"    # Green
Yellow="$(tput bold)$(tput setaf 3)"   # Yellow
Blue="$(tput bold)$(tput setaf 4)"     # Blue
Purple="$(tput bold)$(tput setaf 5)"   # Purple
Cyan="$(tput bold)$(tput setaf 6)"     # Cyan
White="$(tput bold)$(tput setaf 7)"    # White
bgBlack="$(tput bold)$(tput setab 0)"  # Background Black
bgRed="$(tput bold)$(tput setab 1)"    # Background Red
bgGreen="$(tput bold)$(tput setab 2)"  # Background Green
bgYellow="$(tput bold)$(tput setab 3)" # Background Yellow
bgBlue="$(tput bold)$(tput setab 4)"   # Background Blue
bgPurple="$(tput bold)$(tput setab 5)" # Background Purple
bgCyan="$(tput bold)$(tput setab 6)"   # Background Cyan
bgWhite="$(tput bold)$(tput setab 7)"  # Background White

#------------------------------------------------------------------------------------------------
# # # # # # # # # # # # # # # # # #
# SET COLORS FOR THE PROMPT HERE  #
# # # # # # # # # # # # # # # # # #

# Edit Normal Prompt Colors Here
normalHeart=$Red    # Color for the heart
normalCDire=$Red    # Color for the current directory
normalDolar=$Yellow # Color for primary prompt string $

# Edit Git Prompt Colors Here
gpDir=$Yellow # Color for current git directory
gpBrn=$White  # Color for current git branch
gpAMa=$Green  # Color for both total commits and check mark
# this variable takes only background colors. so use colors like bgRed or bgBlue etc
gpBck=$bgBlue # Background color for the box in which git or the diverged symbol is shown
#------------------------------------------------------------------------------------------------

# git prompt will be shown only when you move to a git dir
gitprompt(){
    if `git status &> /dev/null`; then
		declare -i cno=0
		source ~/.bashed-gitprompt.sh
	else
		export PS1='\[$normalHeart\]♥ \[$normalCDire\]\W \[$Yellow\]\$\[\e[0m\] '
		gbranch=""
	fi
}
PROMPT_COMMAND="gitprompt"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
