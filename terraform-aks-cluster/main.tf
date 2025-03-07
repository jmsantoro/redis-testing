resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "agentpool"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = var.node_count
    max_count           = var.max_node_count
    type                = "VirtualMachineScaleSets"
    node_count          = var.node_count
    vnet_subnet_id      = azurerm_subnet.name.id
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
    service_cidr      = "10.0.4.0/24"
    dns_service_ip    = "10.0.4.10"
  }

  identity {
    type = "SystemAssigned"
  }


}