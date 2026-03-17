variable "name" {
  description = "The name of the Synapse Workspace."
  type        = string
}

variable "location" {
  description = "The Azure region where the Synapse Workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Synapse Workspace."
  type        = string
}

variable "storage_data_lake_gen2_filesystem_id" {
  description = "The ID of the Data Lake Storage Gen2 filesystem to be used as the default storage for the Synapse Workspace."
  type        = string
}

variable "sql_administrator_login" {
  description = "The login name of the SQL administrator."
  type        = string
  default     = "sqladminuser"
}

variable "sql_administrator_login_password" {
  description = "The password of the SQL administrator."
  type        = string
  sensitive   = true
}

variable "identity_type" {
  description = "The type of managed identity. Possible values are 'SystemAssigned', 'UserAssigned', or 'SystemAssigned, UserAssigned'."
  type        = string
  default     = "SystemAssigned"
}

variable "managed_virtual_network_enabled" {
  description = "Whether to enable managed virtual network for the Synapse Workspace."
  type        = bool
  default     = false
}

variable "managed_resource_group_name" {
  description = "The name of the managed resource group."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether to enable public network access for the Synapse Workspace."
  type        = bool
  default     = true
}

variable "data_exfiltration_protection_enabled" {
  description = "Whether to enable data exfiltration protection for the Synapse Workspace."
  type        = bool
  default     = false
}

variable "sql_identity_control_enabled" {
  description = "Whether to enable SQL identity control for the Synapse Workspace."
  type        = bool
  default     = false
}

variable "role_assignments" {
  description = "A map of role assignments to apply to the Synapse Workspace."
  type = map(object({
    principal_id          = string
    role_definition_id    = optional(string)
    role_definition_name  = optional(string)
    scope                 = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the Synapse Workspace."
  type        = map(string)
  default     = {}
}
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for diagnostics."
  type        = string
  default     = null
}

variable "enable_diagnostics" {
  description = "Enable diagnostics for the Synapse Workspace."
  type        = bool
  default     = true
}