#!/bin/bash
cp ./.bashed-git-prompt.sh /home/${USER}/
cat ./base.sh >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
