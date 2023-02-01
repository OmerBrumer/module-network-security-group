<!-- BEGIN_TF_DOCS -->

# Network Security Group and Diagnostic Setting module

## Examples
```hcl
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
```

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Id of NSG. |
| <a name="output_name"></a> [name](#output\_name) | Name of NSG. |
| <a name="output_object"></a> [object](#output\_object) | Object of NSG. |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'. | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | (Required)NSG name. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required)A container that holds related resources for an Azure solution. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (Required)Log analytics workspace id to send logs from the current resource. | `string` | `null` | no |
| <a name="input_network_security_rules"></a> [network\_security\_rules](#input\_network\_security\_rules) | (Optional)List of network security rules to apply to VM. | <pre>list(object({<br>    name                                       = string<br>    description                                = string<br>    priority                                   = number<br>    access                                     = string<br>    direction                                  = string<br>    protocol                                   = string<br>    source_address_prefix                      = optional(string)<br>    source_address_prefixes                    = optional(list(string))<br>    source_application_security_group_ids      = optional(list(string))<br>    source_port_range                          = optional(string)<br>    source_port_ranges                         = optional(list(string))<br>    destination_port_range                     = optional(string)<br>    destination_port_ranges                    = optional(list(string))<br>    destination_application_security_group_ids = optional(list(string))<br>    destination_address_prefix                 = optional(string)<br>    destination_address_prefixes               = optional(list(string))<br>  }))</pre> | `[]` | no |



# Authors
Originally created by Omer Brumer
<!-- END_TF_DOCS -->