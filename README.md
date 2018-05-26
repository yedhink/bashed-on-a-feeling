# bashed-on-a-feeling   
a minamalistic and informative git prompt for bash(as of now).  
inspiration from the `terminalparty` theme of `OMZ` and the need for a minimalistic "git" prompt for version control , these two forces drove me to create this.  
["Ooga-chaka, ooga-ooga"](https://youtu.be/NrI-UBIB8Jki) ;)

![](full filled)
![](clean)
![](time taken)
![](non-git dir)

## what do those symbols mean?

* ``master 2↑ 1✚``: on branch ``master``, ahead of remote by 2 commits, 1 file changed but not staged
* ``master 6``: on branch ``master``, 6 files files untracked
* ``master 2✖ 3✚``: on branch ``master``, 2 unstaged, 3 files modified
* ``master ``: on branch ``master``, is clean
* ``mine  ↑3``: on branch ``mine``; your branch has diverged by 3 commits; the repository is otherwise clean
* ``~/bashed-on-a-feeling 39 ``: the fire has been lit , the repo has a total of 39 commits 

## installation
in the above examples i've made use of the Hasklug, a patched variant of [Hasklig]((https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hasklig) and [Font Awesome](https://github.com/FortAwesome/Font-Awesome) fonts.  
**the user is required to install and use any of the nerd fonts and Font Awesome font, inorder to render those fancy symbols that i've used**      
the simplest way to install the fonts on a Linux distro would be to :  
* download and copy all the fonts(.ttf/.otf) to `~/.fonts` for user or /usr/share/fonts/[T/O]TF directory for global
* run `fc-cache -fv ~/.fonts` to let freetype2 know of those fonts

## start installing

on  your terminal:  
```bash
	cd ~ && git clone https://github.com/yedhink/bashed-on-a-feeling.git
	cd ~/bashed-on-a-feeling
	./install.sh
```
then restart your terminal. BOOM!  

## customizing symbols

You can easily change any symbols used by the prompt. Take a look to the file [.bashed-gitprompt.sh]() . You will find a bunch of variables, each of them with its default value. The variables names should be auto-explanatory. Something like  
**note that the editing , after installation, should be done on `.bashed-gitprompt.sh` file in your home(~) directory for the changes to take place**  

```bash
	: ${untracked_files:=''}
```  
You can change the symbols with your custom ones , just by editing the line(s) like above one and replacing current symbol with yours ;)

## uninstall :(  
* just comment out `PROMPT_COMMAND="gitprompt"` in your `.bashrc` to disable this prompt
* (optionally) also remove the lines of code under the heading `bashed-on-a-feeling`in your `.bashrc`
* (optionally) remove the files `.bashed-gitprompt.sh` and `.cal.sh` from home

## contribute  
although i made this for my personal use , i believe , others could get involved and contribute their ideas. i will happily take them into account!  
you've to follow the [Contribution Guidelines]() while you're at it though.
