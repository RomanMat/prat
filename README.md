<!-- Title -->
# prat

**P**ython **R**estful **A**PI **T**emplate.

##

<!-- Project Description -->
## About
There are a lot of good project out there. Each with it's own little integrations ecosystem or technology stacks that fits best their needs. But they never appealed to me as something I want to work with. So I've thought to my-self that it is about time to start putting something together for me. 

A few reasons why are:
* You should not spend time setting up each project from scratch every time.
* Every modern web application has to be easaly deployable.
* Such template has to be lightweight and contain only what is needed. It is quick and easy.

It will not fit all projects. It is just the blueprint for your ideas you can build on and experiment with.

### Built With
* [![FastAPI][FastAPI]][FastAPI-url]
* [![uv][uv]][uv-url]
* [![Docker][Docker]][Docker-url]
* [![kind][kind]][kind-url]
* [![Kubernetes][Kubernetes]][Kubernetes-url]


### Roadmap
Currently I am planning to extend the project with some new features and thing I think are missing. But everyone can suggest a new change.

- [ ] Add linter
- [ ] Add core functionality tests
- [ ] Add CI/CD pipelines




## How to use
To get started you will need to install project tools to your system.

### Prerequisites
Since this repo is meant to be used locally first, I would assume that we will need to make sure, that all the tools for local development are needed as well.
It will be enough to install all the tools listed in **'Built with'** section.


### Steps to run

1. Create k8s cluster
```sh
    kind create cluster --config kind.yaml --name <cluster-name>
```
For example
```sh
    kind create cluster --config kind.yaml --name simple-api-cluster-v1.0
```


2. Build Docker image
```sh
    docker build -t <name>:<version> .
```
For example:
```sh
    docker build -t simple-api:v1.0.0 .
```


3. Push Docker image to the cluster
```sh
    kind load docker-image simple-api:v1.0.0
```
For example:
```sh
    kind load docker-image simple-api:v1.0.0 --name simple-api-cluster-v1.0
```



4. Deploy Kubernetes service
```sh
    kubectl apply -f deployment.yaml
```
```sh
    kubectl apply -f service.yaml
```

5. Forward the ports
```sh
    kubectl port-forward svc/simple-api 8000:5000
```
5. Test the connection
```sh
    curl http://localhost:8000/health
```

***Note: Be careful with ports, you have to conigure them on your own, if you will need a diffrerent one, and make sure they were not busy before.***


## Contact
Email - matviitsivroman@gmail.com \
LinkedIn - https://www.linkedin.com/in/roman-matviitsiv/

## Acknowledgments
Thanks everyone who worked on resources and tools I used here. \
Special thanks to [Pau Labarta Bajo][pau-url] for his guides and inspiration that he shares on his LinkedIn profile

<!-- Links -->
[FastAPI-url]: https://fastapi.tiangolo.com/
[uv-url]: https://astral.sh/blog/uv
[Docker-url]: https://www.docker.com/
[kind-url]: https://kind.sigs.k8s.io/
[Kubernetes-url]: https://kubernetes.io/
[uv-url]: https://github.com/astral-sh/uv
[pau-url]: https://github.com/Paulescu