resource "azurerm_resource_group" "kuberg" {
  name     = "kubernetes-rg"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "azurekubernetescluster"
  location            = azurerm_resource_group.kuberg.location
  resource_group_name = azurerm_resource_group.kuberg.name
  dns_prefix          = "ok"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_a2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


