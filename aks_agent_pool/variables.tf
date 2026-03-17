variable "cluster_id" {
  description = "The ID of the AKS cluster where the agent pool will be created."
  type        = string
}

variable "agent_pools" {
  description = "A map of agent pools to create."
  type = map(object({
    name                = string
    node_count          = optional(number, 1)
    vm_size             = optional(string, "Standard_D2s_v3")
    subnet_id           = optional(string)
    max_pods            = optional(number, 110)
    os_disk_size_gb     = optional(number, 128)
    os_sku              = optional(string, "Ubuntu")
    os_type             = optional(string, "Linux")
    priority            = optional(string, "Regular")
    spot_max_price      = optional(number, -1)
    enable_auto_scaling = optional(bool, false)
    min_count           = optional(number, 1)
    max_count           = optional(number, 10)
    node_labels = optional(map(string), {})
    node_taints = optional(list(object({
      key    = string
      value  = string
      effect = string
    })), [])
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
