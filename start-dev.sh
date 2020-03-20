#!/bin/bash

function stop {
  echo "Stopping nginx..."
  nginx -s quit
}

trap stop EXIT

nginx -c ${PWD}/nginx/conf/nginx.dev.conf

echo -e "Started nginx, please start the individual components in new shells:"
echo "manuka-server: CompileDaemon -command='./manuka-server'"
echo "manuka-client: npm start"
echo "manuka-listener: CompileDaemon -command='./manuka-listener'"
read -n 1 -s -r -p "Press any key to stop nginx:"; echo