@echo on

cd "C:\Users\gleis\Desktop\devops\desafios infra\desafio2\"

::start minikube
minikube start --driver="virtualbox"

::cria alias para o kubectl
::doskey kubectl=minikube kubectl $* 

:: push de imagem local do docker
::minikube -p minikube docker-env --shell powershell | Invoke-Expression

::cd .\Dockerfile

:: constroi minha imagem via dockerfile

::docker build -f gleison/teste .

::cd ..

cd app

:: aplica meu deployment e meu services
kubectl apply -f .\app\deployment.yaml

kubectl apply -f .\app\services.yaml

minikube kubectl get pods

