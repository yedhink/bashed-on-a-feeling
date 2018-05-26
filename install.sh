#!/bin/bash
cp ./.bashed-on-a-feeling.sh /home/${USER}/
cat base.sh >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
