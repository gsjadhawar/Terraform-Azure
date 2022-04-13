#provider block 
provider "azurerm" {
    features {
    }
}

resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  number  = true
}

resource "azurerm_resource_group" "rgname" {
    name     = "${var.rg_name}-${random_string.myrandom.id}"
    location = var.region
    tags     = var.tag
}

resource "azurerm_storage_account" "str_account" {
    name     = var.storage_acc
    resource_group_name = azurerm_resource_group.rgname.name
    location = var.region
    account_tier = "Standard"
    account_replication_type = "LRS"
    account_kind = "StorageV2"
    static_website {
      index_document = var.index_file
      error_404_document = var.error_file
    }
    tags = var.tag
}

resource "azurerm_storage_blob" "myblob" {
    name = var.index_file
    storage_account_name = var.storage_acc
    storage_container_name = "$web"
    type = "Block"
    content_type = "text/html"
    source = var.index_file
    depends_on = [
        azurerm_storage_account.str_account
    ]
}

resource "azurerm_storage_blob" "mybloberror" {
    name = var.error_file
    storage_account_name = var.storage_acc
    storage_container_name = "$web"
    type = "Block"
    content_type = "text/html"
    source = var.error_file
    depends_on = [
      azurerm_storage_account.str_account
    ]
}