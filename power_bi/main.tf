resource "azurerm_powerbi_embedded_capacity" "power_bi_capacity" {
  name                = var.capacity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  administrators      = var.administrators

  tags = var.tags
}

resource "azurerm_resource_group_template_deployment" "power_bi_workspaces" {
  for_each = var.workspaces

  name                = "${var.capacity_name}-workspace-${each.key}"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  template_content = jsonencode({
    "$schema" : "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion" : "1.0.0.0",
    "resources" : []
  })

  depends_on = [azurerm_powerbi_embedded_capacity.power_bi_capacity]
}
