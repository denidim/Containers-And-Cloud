terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "arg" {
  name     = "ContactBookRG${random_integer.ri.result}"
  location = "West Europe"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_service_plan" "asp" {
  name                = "ContactsBookServicePlan"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "alwp" {
  name                = "contactsbookdemoappdenidim"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }
    always_on = false
  }
}

resource "azurerm_app_service_source_control" "example" {
  app_id   = azurerm_linux_web_app.alwp.id
  repo_url = "https://github.com/denidim/Terraform-Deploy-To-Azure-Contact-Book-App"
  branch   = "main"
}