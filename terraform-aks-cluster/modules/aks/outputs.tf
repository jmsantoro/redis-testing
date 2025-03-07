resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size   = "Standard_DS2_v2"
    os_type   = "Linux"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  tags = var.tags
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}