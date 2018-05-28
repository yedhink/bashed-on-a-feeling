#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -rf $DIR/.bashed-gitprompt.sh ~ 
cp -rf $DIR/.cal.sh ~
cat $DIR/base.sh >> ~/.bashrc
source ~/.bashrc
