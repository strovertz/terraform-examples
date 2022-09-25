# Desafio 03: Terraform + Kubernetes

- Criar três instâncias t3.medium Linux utilizando Terraform.
- Configurá-las como 1 master e 2 workers por meio do kubeadm - Os comandos relacionados podem ser econtrados nesse link: https://github.com/badtuxx/DescomplicandoKubernetes/blob/main/pt/day_one/descomplicando_kubernetes.md#instala%C3%A7%C3%A3o-em-cluster-com-truuuuuuu
- Subir um pod com uma imagem http (no padrão HelloWorld) e um service NodePort relacionado (ex: nginx, httpd etc)
- Habilitar o acesso externo ao serviço de modo que consigamos acessar pelo endereço http://<WORKER_NODE_IP>:PORT


## Extras
- Automatização das configuração de cada máquina pelo bootstrap file bash_script (instance user_data: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#user_data)
- Expor o nginx como loadbalancer e integrando-o a um loadbalancer da AWS

## Notas
- Pode ser utilizada qualquer imagem para expor o serviço http, inclusive a imagem nginx do desafio 02

