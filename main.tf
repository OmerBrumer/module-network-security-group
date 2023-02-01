/**
* # Network Security Group and Diagnostic Setting module
*/

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "security_rule" {
    for_each = var.network_security_rules

    content {
      name                                       = security_rule.value["name"]
      description                                = security_rule.value["description"]
      priority                                   = security_rule.value["priority"]
      access                                     = security_rule.value["access"]
      direction                                  = security_rule.value["direction"]
      protocol                                   = security_rule.value["protocol"]
      source_address_prefix                      = security_rule.value["source_address_prefix"]
      source_address_prefixes                    = security_rule.value["source_address_prefixes"]
      source_application_security_group_ids      = security_rule.value["source_application_security_group_ids"]
      source_port_range                          = security_rule.value["source_port_range"]
      source_port_ranges                         = security_rule.value["source_port_ranges"]
      destination_port_range                     = security_rule.value["destination_port_range"]
      destination_port_ranges                    = security_rule.value["destination_port_ranges"]
      destination_application_security_group_ids = security_rule.value["destination_application_security_group_ids"]
      destination_address_prefix                 = security_rule.value["destination_address_prefix"]
      destination_address_prefixes               = security_rule.value["destination_address_prefixes"]
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "diagnostic_settings" {
  source = "git::https://github.com/OmerBrumer/module-diagnostic-setting.git"

  diagonstic_setting_name    = "${azurerm_network_security_group.nsg.name}-diagnostic-setting"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  target_resource_id         = azurerm_network_security_group.nsg.id
}
