#!/bin/bash

####################################################################
##### show status
####################################################################

function status() {
  docker compose -f "$dockerComposeFile" -p "$projectName" ps
}

####################################################################
##### up containers
####################################################################

function up() {
  docker compose -p "$projectName" -f "$dockerComposeFile" up --build -d
}

####################################################################
##### down containers
####################################################################

function down() {
  docker compose -p "$projectName" -f "$dockerComposeFile" down --remove-orphans --rmi local
}

####################################################################
##### recreate containers
####################################################################

function recreate() {
   down && up
}

####################################################################
##### open terminal
####################################################################
function terminal() {
  docker compose -p "$projectName"  -f "$dockerComposeFile" exec -ti go-app /bin/sh
}

####################################################################
##### Prepare arguments
####################################################################

dockerComposeFile="docker-compose.yml"
projectName="go-app"
dateFormat="+%d-%m-%Y %H:%M:%S"
job="$1"

####################################################################
##### Main
####################################################################
case "$job" in
status)
  status
  ;;
up)
  up
  ;;
down)
  down
  ;;
recreate)
  recreate
  ;;
terminal)
  terminal
  ;;
*)
  printMessage "ERROR: command [$job] not found."
  help
  exit 1
  ;;
esac
