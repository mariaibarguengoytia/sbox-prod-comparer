#!/bin/bash
urlVersion=$1
urlChatGoogle=$2
echo "CHECKING $urlVersion..."

case $3 in
hsm)
	echo "platform: hsm"
	vProd=$(curl -s  $urlVersion | jq '.data.body // empty')
	vSbox=$(curl -s $urlVersion -H "XDESP-SANDBOX: true" | jq '.data.body // empty')
;;
*)
	echo "platform: default"
	vProd=$(curl -s  $urlVersion)
	vSbox=$(curl -s $urlVersion -H "XDESP-SANDBOX: true")
;;
esac

echo "PROD: $vProd"
echo "SBOX: $vSbox"

#transforms to base64 to scape easily characters like " {} [] '
vSbox64=$(echo $vSbox | base64)
vProd64=$(echo $vProd | base64)

if [ $vSbox64 != $vProd64 ]; then
  echo "PROD AND SBOX AREN'T EQUALS"
  text=$(echo " PROD-VERSION: *$vProd*  \n SBOX-VERSION: *$vSbox*" | sed "s/\"//g")
  curl -s $urlChatGoogle -H "Content-Type: application/json" -d "{\"text\":\"$text\"}"
else
  echo "PROD AND SBOX ARE EQUALS"
fi
