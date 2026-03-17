variable "name" {
  description = "The name of the virtual network."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "A map of subnets to be created in the virtual network."
  type = map(object({
    name             = string
    address_prefixes = list(string)
    service_endpoints = optional(list(string))
  }))
  default = {}
}
