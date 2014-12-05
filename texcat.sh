#!/bin/bash

cat "$@" |\
  ruby -e 'print STDIN.read.gsub(/\\input\{([^}]+)\}/) { File.read("#{$1}.tex") }' |\
  sed '/^%/d' |\
  sed 's/\([^\]\)%.*$/\1/g' |\
  ruby -e 'print STDIN.read.gsub(/\\comment\s*(?<re>\{(?:(?>[^{}]+)|\g<re>)*\})/,"")' |\
  sed 's/\s+$//g' |\
  cat -s |\
  sed 's/section/subsection/g'
