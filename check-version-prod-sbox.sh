#!/bin/bash
urlVersion=$1
urlChatGoogle=$2
vProd=$(curl -s  $urlVersion)
vSbox=$(curl -s $urlVersion -H "XDESP-SANDBOX: true")

if [ $vProd != $vSbox ]; then
  text=$(echo "PROD-VERSION: *$vProd*  IS DIFFERENT THAN SBOX-VERSION: *$vSbox*" | sed "s/\"//g")
  curl -s $urlChatGoogle -H "Content-Type: application/json" -d "{\"text\":\"$text\"}"
fi
