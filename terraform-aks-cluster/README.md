# terraform-aks-cluster/README.md

# Terraform AKS Cluster

This project provisions a 2-node Linux Azure Kubernetes Service (AKS) cluster using Terraform. 

## Prerequisites

- Azure account
- Terraform installed
- Azure CLI installed and configured

## Project Structure

- `modules/aks`: Contains the AKS module with the main configuration, outputs, and variables.
- `main.tf`: Entry point for the Terraform configuration.
- `outputs.tf`: Outputs for the entire Terraform project.
- `providers.tf`: Provider configuration for Azure.
- `variables.tf`: Input variables for the overall project.
  
## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd terraform-aks-cluster
   ```

2. Configure your Azure credentials:
   ```
   az login
   ```

3. Initialize Terraform:
   ```
   terraform init
   ```

4. Review the planned actions:
   ```
   terraform plan
   ```

5. Apply the configuration to create the AKS cluster:
   ```
   terraform apply
   ```

6. After the deployment is complete, you can access your AKS cluster using the kubeconfig file outputted by the Terraform script.

## Outputs

The project will output the AKS cluster name and the kubeconfig file for accessing the cluster.

## Cleanup

To destroy the resources created by this project, run:
```
terraform destroy
``` 

## License

This project is licensed under the MIT License.