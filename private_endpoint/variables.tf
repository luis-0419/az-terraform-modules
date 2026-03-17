variable "location" {
  description = "The Azure region where the Private Endpoints will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private Endpoints."
  type        = string
}

variable "private_endpoints" {
  description = "A map of private endpoints to create."
  type = map(object({
    name                           = string
    subnet_id                      = string
    private_service_connection_name = string
    private_connection_resource_id = string
    is_manual_connection           = optional(bool)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = list(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the Private Endpoints."
  type        = map(string)
  default     = {}
}
