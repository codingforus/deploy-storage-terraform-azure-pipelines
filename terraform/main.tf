terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "random_id" "storage_account" {
  byte_length = 8
}

resource "azurerm_resource_group" "hcl-rg" {
  name                     = "hcl-resources"
  location                 = "West Europe"
}

resource "azurerm_storage_account" "hcl-sa" {
  name                     = "hcl${lower(random_id.storage_account.hex)}"
  resource_group_name      = azurerm_resource_group.hcl-rg.name
  location                 = azurerm_resource_group.hcl-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "hcl-ct" {
  name                     = "hcl-container"
  storage_account_name     = azurerm_storage_account.hcl-sa.name
  container_access_type    = "private"
}

output "connection_string" {
  value = nonsensitive(azurerm_storage_account.hcl-sa.primary_connection_string)
}
