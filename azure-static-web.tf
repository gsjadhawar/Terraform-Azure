module "azure-static-web" {
    source = "./modules/staticweb"
    rg_name = "myrg-static"
    region = "eastus2"
    storage_acc = "staticwebgsj123"
    tag = {
    env = "test02"
    managed_by = "terraform"
    }
    index_file = "index.html"
    error_file = "error.html"
}