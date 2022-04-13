terraform {
  required_version = "~>1.1.7"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
    random = {
        source = "hashicorp/random"
        version = "=3.1.2"
    }
  }
}

provider "azurerm" {
    features {
    }
}