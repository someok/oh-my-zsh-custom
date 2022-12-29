#!/usr/bin/env bash

cat material.dircolors | sort | uniq | grep -v '*' | grep -v '#' | awk '{print $1}' | while read file; do
touch test/exts/file${file};
done
