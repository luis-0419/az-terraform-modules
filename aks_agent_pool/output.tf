output "agent_pool_ids" {
  description = "The IDs of the agent pools created."
  value = {
    for pool_key, pool in azurerm_kubernetes_cluster_node_pool.agent_pools : pool_key => pool.id
  }
}

output "agent_pool_names" {
  description = "The names of the agent pools created."
  value = {
    for pool_key, pool in azurerm_kubernetes_cluster_node_pool.agent_pools : pool_key => pool.name
  }
}

output "agent_pool_versions" {
  description = "The versions of the agent pools."
  value = {
    for pool_key, pool in azurerm_kubernetes_cluster_node_pool.agent_pools : pool_key => pool.orchestrator_version
  }
}
