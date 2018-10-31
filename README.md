# sbox-prod-comparer
comparador de versiones de sandbox y prod
## Como usarlo

* ```git clone git@github.com:agusKanner/sbox-prod-comparer.git```
* Dar permisos de ejecución a los scripts
* ejecutar ```./check_version_batch_process.sh {archivo_con_urls_versions} {url_chat_de_google}```

## Formato archivo de URls

El archivo con las urls de versiones debe contener una URL por renglon, como por ejemplo

```
 http://proxy/cars-gaia/version
 http://proxy/cars-mossad/version
```


### Ejemplo

`./check_version_batch_process.sh urls.txt https://chat.googleapis.com/v1/spaces.....`
