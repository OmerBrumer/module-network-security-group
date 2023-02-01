module "workspoke_nsg" {
  source = "./modules/security/nsg"

  network_security_group_name = "brumer-final-terraform-hub-nsg"
  resource_group_name         = "brumer-final-terraform-hub-rg"
  location                    = "West Europe"
  network_security_rules = jsondecode(templatefile("./nsg_rules/monitorspoke_nsg_rules.json", {
    vpn_gateway_subnet_adress_prefix     = module.ipam.vpn_gateway_subnet_adress_prefix
    hub_subnet_address_prefix            = module.ipam.hub_subnet_address_prefix
    workspoke_main_subnet_address_prefix = module.ipam.workspoke_main_subnet_address_prefix
    monitorspoke_subnet_address_prefix   = module.ipam.monitorspoke_subnet_address_prefix
    firewall_private_ip_address          = module.ipam.firewall_private_ip_address
  }))
  log_analytics_workspace_id = "/subscriptions/d94fe338-52d8-4a44-acd4-4f8301adf2cf/resourcegroups/brumer-final-terraform-hub-rg/providers/microsoft.operationalinsights/workspaces/brumer-final-terraform-hub-log-analytics"
}