#! /bin/bash

# build image with name karsajobs-ui & tag latest
docker build -t karsajobs-ui:latest .

# rename repository
docker tag karsajobs-ui:latest ghcr.io/inspirasiprogrammer/karsajobs-ui:latest

# login github container registry
echo $PASSWORD_GITHUB | docker login ghcr.io -u inspirasiprogrammer --password-stdin

# push image to github container registry
docker push ghcr.io/inspirasiprogrammer/karsajobs-ui:latest

# pause 
read -p "Press Any key to Exit"