#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -rf -t ~ $DIR/.bashed-gitprompt.sh $DIR/.cal.sh
cat $DIR/base.sh >> ~/.bashrc
source ~/.bashrc
