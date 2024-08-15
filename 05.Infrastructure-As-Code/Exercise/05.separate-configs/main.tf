terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}-${random_integer.ri.result}"
  //location = "North Europe"
  location = var.resource_group_location
}

resource "azurerm_service_plan" "appserviceplan" {
  //name                = "task-board-plan-${random_integer.ri.result}"
  name                = "${var.app_service_plan_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "app" {
  //name                = "task-board-${random_integer.ri.result}"
  name                = "${var.app_service_name}-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
    always_on = false
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = "Data Source=tcp:${azurerm_mssql_server.sql.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};User ID=${azurerm_mssql_server.sql.administrator_login};Password=${azurerm_mssql_server.sql.administrator_login_password};Trusted_Connection=False;MultipleActiveResultSets=True;"
  }
}

resource "azurerm_mssql_server" "sql" {
  //name                         = "task-board-sql-${random_integer.ri.result}"
  name                = "${var.sql_server_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  version             = "12.0"
  //administrator_login          = "user01"
  administrator_login = var.sql_admin_login
  //administrator_login_password = "@Aa123456789!"
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "db" {
  //name           = "TaskBoardDB${random_integer.ri.result}"
  name           = "${var.sql_database_name}${random_integer.ri.result}"
  server_id      = azurerm_mssql_server.sql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  sku_name       = "S0"
  zone_redundant = false
}

resource "azurerm_mssql_firewall_rule" "firewallrule" {
  //name             = "TaskBoardFirewallRule"
  name             = var.firewall_rule_name
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id = azurerm_linux_web_app.app.id
  //repo_url               = "https://github.com/denidim/Terraform-Deploy-To-Azure-Task-Board-App-With-Database"
  repo_url               = var.repo_url
  branch                 = "main"
  use_manual_integration = true
}
