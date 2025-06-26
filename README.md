% Cookie Maker

It's just a make file to create a new project directory.

```sh
PROJ="my-project" bash -c 'wget https://raw.githubusercontent.com/izaakm/cookiemaker/refs/heads/main/Init.mk -P "$PROJ" && cd "$PROJ" && make -f Init.mk'
```
