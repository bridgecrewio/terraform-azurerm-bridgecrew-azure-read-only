terraform {
  required_providers {
    azurerm = {
      version = ">=2.68.0"
      source  = "hashicorp/azurerm"
    }

    random = {
      version = ">=3.1.0"
      source  = "hashicorp/random"
    }

    azuread = {
      version = ">=1.4.0"
      source  = "hashicorp/azuread"
    }

    null = {
      version = ">=3.1.0"
      source  = "hashicorp/null"
    }

  }
  required_version = ">=0.14.8"

}
