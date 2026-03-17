variable "capacity_name" {
  description = "The name of the Power BI embedded capacity."
  type        = string
}

variable "location" {
  description = "The Azure region where the Power BI capacity will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Power BI capacity."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Power BI embedded capacity. Possible values are 'A1', 'A2', 'A3', 'A4', 'A5', 'A6', etc."
  type        = string
  default     = "A1"
}

variable "administrators" {
  description = "A list of email addresses of users who will be administrators of the Power BI capacity."
  type        = list(string)
  default     = []
}

variable "workspaces" {
  description = "A map of Power BI workspaces to configure with the capacity."
  type = map(object({
    workspace_name = optional(string)
    description    = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
