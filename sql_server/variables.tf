variable "server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "location" {
  description = "The Azure region where the SQL Server will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Server."
  type        = string
}

variable "sql_server_version" {
  description = "The version of the SQL Server. Possible values are '2.0' (for SQL Server 2019) and '12.0' (for SQL Server 2017)."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "start_ip_address" {
  description = "The start IP address for the firewall rule."
  type        = string
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  description = "The end IP address for the firewall rule."
  type        = string
  default     = "255.255.255.255"
}

variable "databases" {
  description = "A map of databases to create on the SQL Server."
  type = map(object({
    name           = string
    collation      = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    license_type   = optional(string, "LicenseIncluded")
    max_size_gb    = optional(number, 128)
    sku_name       = optional(string, "Standard")
    zone_redundant = optional(bool, false)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
