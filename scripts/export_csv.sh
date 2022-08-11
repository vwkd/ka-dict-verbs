#!/usr/bin/env bash

# export as CSV
# import CSV in spreadsheet with unique separator `@`
# beware: relies on error correction of filling in missing separators in lines without separator!

# replaces first space, digit bigger than 1 and dot with unique separator `@`
# deletes 1 and dot

sed -r 's/^([^ ]+) /\1@/g; s/ [[:digit:]]+\. /@/g; s/1\. //g' vz/vz.txt > exp.csv