#!/usr/bin/env bash
echo "Make sure that you've installed a font, preferably a nerd font, and also the font awesome set before using"
sleep 1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -rf $DIR/.bashed-gitprompt.sh ~
cp -rf $DIR/.cal.sh ~
cat $DIR/base.sh >> ~/.bashrc
source ~/.bashrc
echo "Installed!!!"
