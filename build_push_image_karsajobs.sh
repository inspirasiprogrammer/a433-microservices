#! /bin/bash

# build image with name karsajobs & tag latest
docker build -t karsajobs:latest .

# rename repository
docker tag karsajobs:latest ghcr.io/inspirasiprogrammer/karsajobs:latest

# login github container registry
echo $PASSWORD_GITHUB | docker login ghcr.io -u inspirasiprogrammer --password-stdin

# push image to github container registry
docker push ghcr.io/inspirasiprogrammer/karsajobs:latest

# pause 
read -p "Press Any key to Exit"