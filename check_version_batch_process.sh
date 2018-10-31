#!/bin/bash
urlChatGoogle=$2
while IFS= read -r versionUrl
do
  ./check-version-prod-sbox.sh $versionUrl $urlChatGoogle
done < "$1"
