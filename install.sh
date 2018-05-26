#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR/.bashed-git-prompt.sh /home/${USER}/
cat ./base.sh >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
