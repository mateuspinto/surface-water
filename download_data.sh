#!/usr/bin/env bash
axel -n 20 -c -o app/data https://zenodo.org/record/5205674/files/dset-s2.zip
unzip -d app/data app/data/dset-s2.zip
