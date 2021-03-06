#!/usr/bin/env bash

set -e -u 

echo "Creating docker and libvirtd groups"
sudo groupadd -f docker
sudo groupadd -f libvirtd

echo "Adding all users to groups"
for user in /users/*
do
  username=$(basename $user)
  echo " user: $username"
  sudo usermod -a -G docker,libvirtd $username
done

echo "Done!"

