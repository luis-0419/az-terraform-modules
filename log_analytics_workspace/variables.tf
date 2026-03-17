variable "workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "The Azure region where the Log Analytics workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Log Analytics workspace."
  type        = string
}

variable "sku" {
  description = "The SKU for the Log Analytics workspace. Possible values are 'PerGB2018' and 'Free'."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values range between 0 and 730."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingested data in GB. If set to -1 then there is no daily quota."
  type        = number
  default     = -1
}

variable "internet_ingestion_enabled" {
  description = "Should the Log Analytics workspace accept data from the internet? Defaults to true."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Should the Log Analytics workspace allow queries from the internet? Defaults to true."
  type        = bool
  default     = true
}

variable "solutions" {
  description = "A map of Log Analytics solutions to add to the workspace."
  type = map(object({
    solution_name = string
    publisher     = string
    product       = string
  }))
  default = {
    security = {
      solution_name = "Security"
      publisher     = "Microsoft"
      product       = "OMSGallery/Security"
    }
    updates = {
      solution_name = "Updates"
      publisher     = "Microsoft"
      product       = "OMSGallery/Updates"
    }
  }
}

variable "saved_searches" {
  description = "A map of saved searches to create in the workspace."
  type = map(object({
    query        = string
    display_name = string
    category     = string
  }))
  default = {}
}

variable "action_groups" {
  description = "A map of action groups for alerts."
  type = map(object({
    short_name = string
    email_receivers = optional(list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = optional(bool, false)
    })), [])
    webhook_receivers = optional(list(object({
      name                    = string
      service_uri             = string
      use_common_alert_schema = optional(bool, false)
    })), [])
  }))
  default = {}
}

variable "metric_alerts" {
  description = "A map of metric alerts to create."
  type = map(object({
    description    = optional(string, "")
    severity       = optional(number, 3)
    frequency      = optional(string, "PT1M")
    window_size    = optional(string, "PT5M")
    enabled        = optional(bool, true)
    action_group_id = optional(string)
    criteria = object({
      metric_name      = string
      metric_namespace = string
      operator         = string
      threshold        = number
      aggregation      = optional(string, "Average")
    })
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
