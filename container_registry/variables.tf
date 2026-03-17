variable "registry_name" {
  description = "The name of the container registry. Must be between 5 and 50 characters and contain only lowercase alphanumeric characters."
  type        = string
}

variable "location" {
  description = "The Azure region where the container registry will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container registry."
  type        = string
}

variable "sku" {
  description = "The SKU name of the container registry. Possible values are 'Basic', 'Standard', and 'Premium'."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled for the container registry."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the container registry."
  type        = bool
  default     = true
}

variable "webhooks" {
  description = "A map of webhooks to create for the container registry."
  type = map(object({
    service_uri    = string
    status         = optional(string, "enabled")
    scope          = optional(string, "")
    actions        = optional(list(string), ["push", "delete"])
    custom_headers = optional(map(string), {})
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
