#!/bin/bash
urlVersion=$1
urlChatGoogle=$2
vProd=$(curl -s  $urlVersion)
vSbox=$(curl -s $urlVersion -H "XDESP-SANDBOX: true")
#transforms to base64 to scape easily characters like " {} [] '
vSbox64=$(echo $vSbox | base64)
vProd64=$(echo $vProd | base64)

echo "checking $urlVersion..."
if [ $vSbox64 != $vProd64 ]; then
  text=$(echo " PROD-VERSION: *$vProd*  \n SBOX-VERSION: *$vSbox*" | sed "s/\"//g")
  curl -s $urlChatGoogle -H "Content-Type: application/json" -d "{\"text\":\"$text\"}"
fi
