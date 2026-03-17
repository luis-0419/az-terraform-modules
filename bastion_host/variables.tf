variable "name" {
  description = "The name of the Bastion Host."
  type        = string
}

variable "location" {
  description = "The Azure region where the Bastion Host will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Bastion Host."
  type        = string
}

variable "bastion_subnet_id" {
  description = "The ID of the subnet which the Bastion Host will be deployed in."
  type        = string
}

variable "bastion_sku" {
  description = "The SKU of the Bastion Host. Possible values are 'Basic' and 'Standard'."
  type        = string
  default     = "Basic"
}

variable "copy_paste_enabled" {
  description = "Whether to enable copy/paste functionality."
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "Whether to enable file copy functionality."
  type        = bool
  default     = false
}

variable "ip_connect_enabled" {
  description = "Whether to enable IP Connect functionality."
  type        = bool
  default     = false
}

variable "shareable_link_enabled" {
  description = "Whether to enable shareable link functionality."
  type        = bool
  default     = false
}

variable "tunneling_enabled" {
  description = "Whether to enable tunneling functionality."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the Bastion Host."
  type        = map(string)
  default     = {}
}
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for diagnostics."
  type        = string
  default     = null
}

variable "enable_diagnostics" {
  description = "Enable diagnostics for the Bastion Host."
  type        = bool
  default     = true
}