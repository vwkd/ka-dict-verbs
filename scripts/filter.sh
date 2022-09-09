#!/usr/bin/env bash

# filter out lines containing symbols
# "/", "(", ")", "-", "u. ä.", "od.", "usw.", "bzw.", '"', "Pkt."

sed -r '/\/|\(|\)|\-|u\.|od\.|usw\.|bzw\.|\"|Pkt\./d' vz/vz.txt > vz_filtered.txt