#!/bin/bash

#Variabel yang diperlukan untuk build dan push images
username="agustinusbpm"
registry="ghcr.io"
container_name="karsajobs-ui"

#Perintah untuk build image
docker build -t $registry/$username/$container_name:latest .

#Perintah untuk login ke docker registry (Github Packages)
echo $pat | docker login $registry -u $username --password-stdin

#Perintah untuk push image ke github packages
docker push $registry/$username/$container_name:latest