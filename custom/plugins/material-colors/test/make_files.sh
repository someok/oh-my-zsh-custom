#!/usr/bin/env bash

dir=$(dirname $BASH_SOURCE)

cat ${dir}/../material.dircolors |\
 sort                            |\
 uniq                            |\
 grep -v '*'                     |\
 grep -v '#'                     |\
 grep -v 'TERM'                  |\
 grep -v 'EXEC'                  |\
 awk '{print $1}'                |\
while read file; do
  touch ${dir}/exts/file${file};
done

cat ${dir}/../material.dircolors |\
 sort                            |\
 uniq                            |\
 grep '*'                        |\
 grep -v '#'                     |\
 grep -v 'TERM'                  |\
 grep -v 'EXEC'                  |\
 awk '{print $1}'                |\
while read file; do
  touch ${dir}/exts/${file:1};
done
