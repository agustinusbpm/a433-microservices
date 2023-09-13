#!/bin/bash

#variabel
imageName="item-app"
tag="v1"
username="agustinusbpm"
pat="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"

# Build docker image dari Dockerfile pada satu direktory
docker build -t $imageName:$tag .
# List daftar image pada lokal
docker images
# Mengubah nama agar sesuai dengan format dari github packages
docker tag $imageName:$tag ghcr.io/$username/$imageName:$tag
# login ke akun github packages
echo $pat | docker login ghcr.io -u $username --password-stdin
# push image dari lokal ke github packages
docker push ghcr.io/$username/$imageName:$tag