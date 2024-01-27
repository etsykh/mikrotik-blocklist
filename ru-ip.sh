#!/bin/bash

# URLs to download from
url1="https://raw.githubusercontent.com/herrbischoff/country-ip-blocks/master/ipv4/ru.cidr"
url2="https://raw.githubusercontent.com/herrbischoff/country-ip-blocks/master/ipv4/by.cidr"

# Filename for the combined file
combined_file="block.cidr"

# Download the files
curl -o ru.cidr $url1
curl -o by.cidr $url2

# Combine the files
cat ru.cidr by.cidr > $combined_file

# Split the combined file into smaller files
split -b 63k $combined_file "block.part."

# Add, commit, and push the files to your GitHub repository
git add .
git commit -m "Add block list parts"
git push https://github.com/etsykh/mikrotik-blocklist.git master

