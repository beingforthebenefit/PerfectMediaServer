#!/bin/bash

helpFunction(){
    echo ""
    echo "Usage: $0 start|stop"
    echo -e "\tstart - enter maintenance mode"
    echo -e "\tstop - exit maintenance mode"
}

if [ "$1" = "start" ]; then
    sudo docker stop overseerr \
    && sudo docker run --rm -d --name maintenance -e TEAM_NAME='76Flix' -e TITLE="Upgrading Server..." -e MAIL_ADDRESS=beingforthebenefit@gmail.com -p 80:8080 wickerlabs/maintenance;
elif [ "$1" = "stop" ]; then
    sudo docker stop maintenance \
    && sudo docker start overseerr
else
    echo "Incorrect usage";
    helpFunction
fi