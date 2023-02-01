variable "resource_group_name" {
  description = "(Required)A container that holds related resources for an Azure solution."
  type        = string
}

variable "location" {
  description = "(Required)The location to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'."
  type        = string
}

variable "network_security_group_name" {
  description = "(Required)NSG name."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "(Required)Log analytics workspace id to send logs from the current resource."
  type        = string
  default     = null
}

variable "network_security_rules" {
  description = "(Optional)List of network security rules to apply to VM."
  type = list(object({
    name                                       = string
    description                                = string
    priority                                   = number
    access                                     = string
    direction                                  = string
    protocol                                   = string
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(list(string))
    source_application_security_group_ids      = optional(list(string))
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(list(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(list(string))
  }))
  default = []
}