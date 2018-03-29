#!/usr/bin/env bash

for d in $(ls -1d */ | sed s:/::);
do
    echo "Installing $d"
    stow $d
done
