variable "location" {
  description = "The Azure region where the container instances will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container instances."
  type        = string
}

variable "containers" {
  description = "A map of container groups to create."
  type = map(object({
    name                = string
    os_type             = optional(string, "Linux")
    restart_policy      = optional(string, "Always")
    ip_address_type     = optional(string, "Public")
    dns_name_label      = optional(string)
    container_list = list(object({
      name   = string
      image  = string
      cpu    = optional(number, 1)
      memory = optional(number, 1.5)
      ports = optional(list(object({
        port     = number
        protocol = optional(string, "TCP")
      })), [])
      environment_variables = optional(list(object({
        name  = string
        value = string
      })), [])
    }))
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
