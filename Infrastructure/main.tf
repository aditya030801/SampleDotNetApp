provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = var.subscription_id

}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}


terraform {
  backend "azurerm" {
    storage_account_name = "tfproj1store"
    container_name       = "store-cont"
    key                  = "terraform.tfstate"
    resource_group_name  = "TerraformProj1"
  }
}

module "Modules" {
  source = "./modules"
  # insert the 7 required variables here
}

