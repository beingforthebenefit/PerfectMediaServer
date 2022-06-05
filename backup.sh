#!/bin/bash

helpFunction(){
    echo ""
    echo "Usage: $0 start|stop"
    echo -e "\tstart - enter back mode"
    echo -e "\tstop - exit backup mode"
}

if [ "$1" = "start" ]; then
    sudo docker stop overseerr organizr transmission radarr sonarr readarr tdarr bazarr tautulli speedtest monitorr \
    && sudo docker run --rm -d --name backup -e TEAM_NAME='76Flix' -e TITLE="Running nightly backup of server..." -e MAIL_ADDRESS=beingforthebenefit@gmail.com -p 80:8080 wickerlabs/maintenance \
    ;
elif [ "$1" = "stop" ]; then
    sudo docker stop backup \
    && sudo docker start overseerr organizr transmission tdarr radarr sonarr readarr bazarr tautulli speedtest monitorr;
else
    echo "Incorrect usage";
    helpFunction
fi
