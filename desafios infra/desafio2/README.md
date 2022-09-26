# Desafio 02: Kubernetes

## Objetivo

Dentro deste repositório existe um subdiretório **app** e um **Dockerfile** que constrói essa imagem, seu objetivo é:

- Construir a imagem docker da aplicação
- Criar os manifestos de recursos kubernetes para rodar a aplicação (_deployments, services, ingresses, configmap_ e qualquer outro que você considere necessário)
- Criar um _script_ para a execução do _deploy_ em uma única execução.
- A aplicação deve ter seu _deploy_ realizado com uma única linha de comando em um cluster kubernetes **local**
- Todos os _pods_ devem estar rodando
- A aplicação deve responder à uma URL específica configurada no _ingress_
- Divisão de recursos por _namespaces_
- Utilização de _health check_ na aplicação

## Extras

- Utilizar Helm [HELM](https://helm.sh)
- Fazer com que a aplicação exiba seu nome ao invés de **"Olá, candidato!"**

## Notas

- Utilizar o [Minikube](https://github.com/kubernetes/minikube) ou [Docker for Mac/Windows](https://docs.docker.com/docker-for-mac/) para execução do desafio e realização de testes.
- A aplicação sobe por _default_ utilizando a porta **3000** e utiliza uma variável de ambiente **$NAME**
- Não é necessário realizar o _upload_ da imagem Docker para um registro público, você pode construir a imagem localmente e utilizá-la diretamente.
