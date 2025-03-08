# AKS - Persistent Volume Claims
[Dynamic Volume Provisioning in AKS](https://dev.to/sxmmie/dynamic-volume-provisioning-in-aks-3ep9)

### Configure the environment
> Terraform is used to deploy the AKS cluster

- Authenticate to Azure with the cli
``` bash
$ az login
```
- Prepare the terraform deployment. If just pulled, execute 'terraform init'
``` bash
terraform plan -out=aks-deploy.tfplan

terraform apply aks-deploy.tfplan
```
- Get the AKS cluster credentials using azcli
``` bash
az aks get-credentials --resource-group sneaky-ermine-rg --name my-aks-cluster
```
- Deploy the PVC
``` bash
k apply -f pvc-deployment.yaml
```
- Deploy Bitnami Redis Helm chart (with no security).
- [Bitnami package for Redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)
``` bash
helm install redis-pvc oci://registry-1.docker.io/bitnamicharts/redis -f values.yaml
```