output "cluster_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "cluster_name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "The Kubernetes configuration."
  value       = azurerm_kubernetes_cluster.aks.kube_config
  sensitive   = true
}

output "kube_config_raw" {
  description = "The raw Kubernetes configuration."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL."
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_enabled ? azurerm_kubernetes_cluster.aks.oidc_issuer_url[0] : null
}

output "client_id" {
  description = "The client ID of the managed identity."
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "fqdn" {
  description = "The FQDN of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "portal_fqdn" {
  description = "The portal FQDN of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.portal_fqdn
}

output "node_pool_ids" {
  description = "The IDs of the node pools."
  value = {
    for pool_key, pool in azurerm_kubernetes_cluster_node_pool.node_pools : pool_key => pool.id
  }
}

output "node_pool_names" {
  description = "The names of the node pools."
  value = {
    for pool_key, pool in azurerm_kubernetes_cluster_node_pool.node_pools : pool_key => pool.name
  }
}
