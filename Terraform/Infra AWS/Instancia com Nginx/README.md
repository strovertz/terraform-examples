# Desafio 01: TERRAFORM

## Objetivo

- Criar uma instância t2.micro Linux utilizando Terraform: OK!
- A instância deve ter aberta somente às portas 80 e 443 para todos os endereços: OK!
- A porta SSH (22) deve estar acessível somente para um range IP definido: OK!
- **Inputs**: A execução do projeto deve aceitar dois parâmetros: OK!
  - O IP ou range necessário para a liberação da porta SSH: OK!
  - A região da cloud em que será provisionada a instância: OK!
- **Outputs**: A execução deve imprimir o IP público da instância: OK!
- Pré-instalar o docker na instância que suba automaticamente a imagem do [NGINX](https://hub.docker.com/r/nginxdemos/hello), tornando a página visualizável ao acessar o IP público da instância: OK!

## Extras

- Utilização de módulos do Terraform
- Utilização de um certificado dummy para acesso via https
- Utilização de docker-compose

## Notas

- Será disponibilizado o acesso à uma conta na AWS para que os recursos sejam criados para a apresentação.