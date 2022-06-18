#!/bin/bash
echo "fetching new version of app"
git fetch origin main
git merge origin/main
echo "stopping current app"
docker stop dolboeb
docker rm dolboeb
docker rmi dolboeb_image
echo "starting new app"
docker build -t dolboeb_image .
docker run --name dolboeb -d dolboeb_image