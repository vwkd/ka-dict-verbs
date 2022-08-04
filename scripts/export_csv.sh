#!/usr/bin/env bash

# replaces first space with unique separator `@`
# import CSV in spreadsheet with unique separator `@`

sed -r 's/^([^ ]+) /\1@/g' vz/vz.txt > exp.csv