output "rg_name" {
    value = azurerm_resource_group.rgname.name
}

output "rg_id" {
    value = azurerm_resource_group.rgname.id  
}

output "str_name" {
    value = azurerm_storage_account.str_account.name
}

output "str_id" {
    value = azurerm_storage_account.str_account.id
}