variable "name" {
  description = "The name of the Data Factory."
  type        = string
}

variable "location" {
  description = "The Azure region where the Data Factory will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Data Factory."
  type        = string
}

variable "identity_type" {
  description = "The type of managed identity. Possible values are 'SystemAssigned', 'UserAssigned', or 'SystemAssigned, UserAssigned'."
  type        = string
  default     = "SystemAssigned"
}

variable "managed_virtual_network_enabled" {
  description = "Whether to enable managed virtual network for the Data Factory."
  type        = bool
  default     = false
}

variable "public_network_enabled" {
  description = "Whether to enable public network access for the Data Factory."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the Data Factory."
  type        = map(string)
  default     = {}
}
