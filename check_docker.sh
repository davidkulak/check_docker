#!/bin/bash
#Auteur : David KULAK
#Source : github.com/davidkulak/check_docker

function fHelp
{
    echo "USAGE: ./check_docker.sh [H <socket>]"
    echo "    -H | Socket location"
    exit 0;
}

function fCountContainers
{
    nbContainers=$(docker -H $HOST ps -q | wc -l)
}

function fCountImages
{
    nbImages=$(docker -H $HOST images -q | wc -l)
}

#INIT

HOSTARG=""

#PARAM

while getopts H:h option
do
 case $option in
  H) HOSTARG=${OPTARG} ;;
  h) fHelp ;;
  *) fHelp ;;
 esac
done

if [[ $HOSTARG == "" ]]; then
    HOST="unix:///var/run/docker.sock"
else
    HOST=$HOSTARG
fi

docker -H $HOST ps > /dev/null 2>&1

if [ $? -eq 0 ]; then
  fCountContainers
  fCountImages
  echo "OK - Docker engine running. | containers=$nbContainers images=$nbImages"
  exit 0
elif [ $? -eq 1 ]; then
  echo "CRITICAL - Docker engine not running."
  exit 2
else
  echo "UNKNOW - Docker is in unknow state."
  exit 3
fi
