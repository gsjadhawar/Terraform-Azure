variable "rg_name" {
    type = string
    description = "resource group name"
    validation {
      condition = length(var.rg_name) > 4
      error_message = "Resource group name should be longer than 4 characters."
    } 
}

variable "region" {
    type = string
    description = "location of resource to be provisioned"
    validation {
      condition = var.region != "null" 
      error_message = "Location to provision resource should be provided."
    }
}

variable "storage_acc" {
    type = string
    description = "storage account name"
    validation {
      condition = var.storage_acc != "null"
      error_message = "Storage account name should be provided."
    }
}

variable "tag" {
    type = object({
     env = string
     managed_by = string 
    })
    description = "Tags provided to resources."
}

variable "index_file" {
    type = string
    description = "index_file name"
}

variable "error_file" {
    type = string
    description = "error_file name" 
}