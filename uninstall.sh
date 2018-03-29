#!/usr/bin/env bash

for d in $(ls -1d */ | sed s:/::);
do
    echo "Uninstalling $d"
    stow -D $d
done
