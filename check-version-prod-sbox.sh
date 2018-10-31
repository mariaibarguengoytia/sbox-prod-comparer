#!/bin/bash

vProd=$(curl -s  $1)
vSbox=$(curl -s $1 -H "XDESP-SANDBOX: true")

if [ $vProd != $vSbox ]; then
  text=$(echo "PROD-VERSION: *$vProd*  IS DIFFERENT THAN SBOX-VERSION: *$vSbox*" | sed "s/\"//g")
  curl -s $2 -H "Content-Type: application/json" -d "{\"text\":\"$text\"}"
fi
