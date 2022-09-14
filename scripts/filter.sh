#!/usr/bin/env bash

# filter out lines containing symbols
# "(", ")", "-", "u. ä.", "usw.", "bzw.", '"', "Pkt."

sed -r '/\(|\)|\-|u\.|usw\.|bzw\.|\"|Pkt\./d' vz/vz.txt > vz_filtered.txt