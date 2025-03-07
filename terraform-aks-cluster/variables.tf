variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the AKS cluster will be deployed"
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "max_node_count" {
  description = "The maximum number of nodes in the AKS cluster"
  type        = number
}

variable "node_vm_size" {
  description = "The size of the virtual machines for the AKS nodes"
  type        = string
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
}