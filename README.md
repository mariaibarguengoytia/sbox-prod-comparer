# sbox-prod-comparer
comparador de versiones de sandbox y prod
## Como usarlo

* ```git clone git@github.com:despegar/sbox-prod-comparer.git```
* Dar permisos de ejecución a los scripts
* ejecutar ```./check_version_batch_process.sh {archivo_con_urls_versions} '{url_chat_de_google}'```

## Formato archivo de URls

El archivo con las urls de versiones debe contener una URL por renglon, como por ejemplo

```
 http://proxy/cars-gaia/version
 http://proxy/cars-mossad/version
```


### Ejemplo

`./check_version_batch_process.sh urls.txt https://chat.googleapis.com/v1/spaces.....'`


### Ejemplo de task de Jenkins

* Crear una tarea que se descargue el repo.
* crear desde una linea de comandos el siguiente script:

```
rm urls_version.txt
echo "http://proxy/cars-gaia/version" >> urls_version.txt
echo "http://proxy/v3/cars/search/version" >> urls_version.txt
//...más urls para checkear

chmod +x check_version_batch_process.sh check-version-prod-sbox.sh
./check_version_batch_process.sh urls_version.txt 'https://chat.googleapis.com/v1/spaces/AAAAq90w1fY...'
```
