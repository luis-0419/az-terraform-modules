output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.key_vault.id
}

output "name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.key_vault.name
}

output "vault_uri" {
  description = "The URI of the Key Vault."
  value       = azurerm_key_vault.key_vault.vault_uri
}

output "access_policies" {
  description = "The access policies applied to the Key Vault."
  value = {
    for key, policy in azurerm_key_vault_access_policy.policies : key => {
      object_id               = policy.object_id
      key_permissions         = policy.key_permissions
      secret_permissions      = policy.secret_permissions
      certificate_permissions = policy.certificate_permissions
    }
  }
}
