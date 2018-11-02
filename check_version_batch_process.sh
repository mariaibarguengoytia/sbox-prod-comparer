#!/bin/bash
urlChatGoogle=$2
project=$3
while IFS= read -r versionUrl
do
  ./check-version-prod-sbox.sh $versionUrl $urlChatGoogle $project
done < "$1"
