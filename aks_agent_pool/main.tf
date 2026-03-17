resource "azurerm_kubernetes_cluster_node_pool" "agent_pools" {
  for_each = var.agent_pools

  name                  = each.value.name
  kubernetes_cluster_id = var.cluster_id
  node_count            = each.value.node_count
  vm_size               = each.value.vm_size
  vnet_subnet_id        = each.value.subnet_id
  max_pods              = each.value.max_pods
  os_disk_size_gb       = each.value.os_disk_size_gb
  os_sku                = each.value.os_sku
  os_type               = each.value.os_type
  priority              = each.value.priority
  spot_max_price        = each.value.spot_max_price
  enable_auto_scaling   = each.value.enable_auto_scaling
  min_count             = each.value.min_count
  max_count             = each.value.max_count

  node_labels = each.value.node_labels
  node_taints = each.value.node_taints

  tags = merge(
    var.tags,
    {
      agent_pool = each.value.name
    }
  )
}
