### Pre-requisites
Make sure the following are installed on your system prior to running the project
* [Docker](https://docs.docker.com/engine/install/)
* [Poetry](https://python-poetry.org/docs/#installing-with-the-official-installer)

### Build docker image
Create a `.env` file using `.env.dist` as a template.


```bash
docker build . -t <image-name>
```

### Run the docker image
```bash
docker run --rm -it -p 8000:80 <image-name>
```
