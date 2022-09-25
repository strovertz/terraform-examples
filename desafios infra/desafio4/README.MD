**Desafio 04: Terraform + EKS**
Objetivo:
´´´
    Criar um cluster EKS por meio do terraform: OK

    Criar e associar um nodegroup "nginx" a esse cluster EKS por meio do terraform (instâncias t3.medium)

    Criar um autoscaling group associado ao nodegroup de nginx por meio do terraform (Valores do autoscaling: máximo 3, mínimo 1)

    Aplicar corretamente o deployment de autoscaling do EKS: https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html

    Por meio do AWS CLI, conectar-se ao cluster EKS por meio do comando "update-kubeconfig"

    Fazer o deployment de uma imagem nginx e um serviço ClusterIP associado

    Acessar seu nginx server localmente por meio do comando "kubectl port-forward"
    
´´´
Extras:
    Crie um nodegroup "monitoring", um namespace "monitoring" e faça o deployment do prometheus+grafana