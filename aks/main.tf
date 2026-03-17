resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.default_node_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    vnet_subnet_id  = var.subnet_id
    max_pods        = var.max_pods
    os_disk_size_gb = var.os_disk_size_gb
    os_sku          = var.os_sku

    tags = var.tags
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    pod_cidr          = var.pod_cidr
    load_balancer_sku = var.load_balancer_sku
  }

  role_based_access_control_enabled = var.rbac_enabled

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.secret_rotation_enabled
    secret_rotation_interval = var.secret_rotation_interval
  }

  azure_policy_enabled = var.azure_policy_enabled

  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  monitor_metrics {
    annotations_allowed = var.annotations_allowed
    labels_allowed      = var.labels_allowed
  }

  local_account_disabled = var.local_account_disabled
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  tags = var.tags

  depends_on = [
    var.depends_on_resources
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  for_each = var.node_pools

  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = each.value.node_count
  vm_size               = each.value.vm_size
  vnet_subnet_id        = each.value.subnet_id
  max_pods              = each.value.max_pods
  os_disk_size_gb       = each.value.os_disk_size_gb
  os_sku                = each.value.os_sku
  os_type               = each.value.os_type
  priority              = each.value.priority
  spot_max_price        = each.value.spot_max_price

  node_labels = each.value.node_labels
  node_taints = each.value.node_taints

  tags = var.tags
}
