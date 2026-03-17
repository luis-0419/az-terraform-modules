variable "resource_group_name" {
  description = "The name of the resource group where the virtual network is located."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to peer."
  type        = string
}

variable "peerings" {
  description = "A map of virtual network peerings to create."
  type = map(object({
    name                         = string
    remote_virtual_network_id    = string
    allow_virtual_network_access = optional(bool)
    allow_forwarded_traffic      = optional(bool)
    allow_gateway_transit        = optional(bool)
    use_remote_gateways          = optional(bool)
  }))
  default = {}
}
