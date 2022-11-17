terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.42.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "99069990-be5b-4d67-9f21-49ceb78da068"
  tenant_id       = "5c9e059c-3929-4dcd-a2da-b11cd4e8b1d4"
  features {}
}

resource "azurerm_resource_group" "rg-aula-infra" {
  name     = "myResourceGroup"
  location = "westus"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "default"
  location            = "westus"
  resource_group_name = "rg-aula-infra"
  dns_prefix          = "k8stest"


  default_node_pool {
    name    = "agentpool"
    vm_size = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "2780b5b4-08d9-428d-8b33-750cb2ebc873"
    client_secret = "bvd8Q~oTRVPnq.PuPVqP69ZfHCwr6GmMIqXqsb9s"
  }
}
