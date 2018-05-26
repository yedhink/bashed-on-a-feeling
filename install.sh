#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -rf -t /home/${USER}/ $DIR/.bashed-gitprompt.sh $DIR/.cal.sh
cat $DIR/base.sh >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
