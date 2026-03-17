variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to deploy."
  type        = string
  default     = "1.27"
}

variable "subnet_id" {
  description = "The ID of the subnet where the AKS cluster will be deployed."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "The size of the VMs in the default node pool."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "max_pods" {
  description = "The maximum number of pods per node."
  type        = number
  default     = 110
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB."
  type        = number
  default     = 128
}

variable "os_sku" {
  description = "The OS SKU to use. Possible values are 'Ubuntu' and 'CBLMariner'."
  type        = string
  default     = "Ubuntu"
}

variable "identity_type" {
  description = "Type of managed identity for the cluster. Possible values are 'SystemAssigned' and 'UserAssigned'."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "List of user assigned identity IDs."
  type        = list(string)
  default     = []
}

variable "network_plugin" {
  description = "The network plugin to use. Possible values are 'azure' and 'kubenet'."
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "The network policy to use. Possible values are 'azure' and 'calico'."
  type        = string
  default     = "azure"
}

variable "service_cidr" {
  description = "The CIDR for the service network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "dns_service_ip" {
  description = "The DNS service IP for the AKS cluster."
  type        = string
  default     = "10.0.0.10"
}

variable "pod_cidr" {
  description = "The CIDR for the pod network."
  type        = string
  default     = "10.244.0.0/16"
}

variable "load_balancer_sku" {
  description = "The load balancer SKU to use. Possible values are 'basic' and 'standard'."
  type        = string
  default     = "standard"
}

variable "rbac_enabled" {
  description = "Whether RBAC is enabled for the AKS cluster."
  type        = bool
  default     = true
}

variable "secret_rotation_enabled" {
  description = "Whether secret rotation is enabled."
  type        = bool
  default     = true
}

variable "secret_rotation_interval" {
  description = "The interval for secret rotation."
  type        = string
  default     = "5m"
}

variable "azure_policy_enabled" {
  description = "Whether Azure Policy is enabled."
  type        = bool
  default     = true
}

variable "oidc_issuer_enabled" {
  description = "Whether OIDC issuer is enabled."
  type        = bool
  default     = true
}

variable "workload_identity_enabled" {
  description = "Whether workload identity is enabled."
  type        = bool
  default     = true
}

variable "annotations_allowed" {
  description = "List of allowed annotations."
  type        = list(string)
  default     = []
}

variable "labels_allowed" {
  description = "List of allowed labels."
  type        = list(string)
  default     = []
}

variable "local_account_disabled" {
  description = "Whether local account is disabled."
  type        = bool
  default     = true
}

variable "api_server_authorized_ip_ranges" {
  description = "List of authorized IP ranges for API server access."
  type        = list(string)
  default     = []
}

variable "node_pools" {
  description = "A map of additional node pools to create."
  type = map(object({
    name           = string
    node_count     = optional(number, 1)
    vm_size        = optional(string, "Standard_D2s_v3")
    subnet_id      = optional(string)
    max_pods       = optional(number, 110)
    os_disk_size_gb = optional(number, 128)
    os_sku         = optional(string, "Ubuntu")
    os_type        = optional(string, "Linux")
    priority       = optional(string, "Regular")
    spot_max_price = optional(number, -1)
    node_labels    = optional(map(string), {})
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

variable "depends_on_resources" {
  description = "Resources that the AKS cluster depends on."
  type        = any
  default     = null
}
