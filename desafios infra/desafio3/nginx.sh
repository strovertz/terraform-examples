#!/bin/bash
senha1="teste123"
novo_usuario="ubuntus"
grupo="ubuntus"

# aguarda a instancia iniciar
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 2
done
#criand nosso user
sudo useradd -m $novo_usuario -p $(openssl passwd -1 $senha1) -s /bin/bash
chown -R $nome /home/$nome
echo "Usuario criado"

sudo usermod -aG sudo ubuntus

sudo su ubuntus

# Instala o kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client

#criando alias e auto complete
source <(kubectl completion bash) # configura o autocomplete na sua sessão atual (antes, certifique-se de ter instalado o pacote bash-completion).

echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanentemente ao seu shell.

alias k=kubectl

complete -F __start_kubectl k

#instalação do minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

yes Y | sudo apt update
yes Y | sudo apt upgrade

yes Y | chmod +x ./minikube

sudo mv ./minikube /usr/local/bin/minikube

minikube version

#intalando kvm
yes Y | sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

sudo adduser ubuntus libvirtd

exit

su ubuntus

#startando minikube
yes Y | minikube start --vm-driver kvm2

