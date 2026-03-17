resource "azurerm_public_ip" "firewall_pip" {
  name                = "${var.firewall_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = var.pip_sku

  tags = var.tags
}

resource "azurerm_firewall" "azure_firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  threat_intel_mode   = var.threat_intel_mode

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }

  tags = var.tags
}

resource "azurerm_firewall_nat_rule_collection" "nat_rules" {
  for_each = var.nat_rules

  name                = each.key
  azure_firewall_name = azurerm_firewall.azure_firewall.name
  resource_group_name = var.resource_group_name
  priority            = each.value.priority
  action              = "Dnat"

  dynamic "rule" {
    for_each = each.value.rules
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      translated_port       = rule.value.translated_port
      translated_address    = rule.value.translated_address
      protocols             = rule.value.protocols
    }
  }
}

resource "azurerm_firewall_network_rule_collection" "network_rules" {
  for_each = var.network_rules

  name                = each.key
  azure_firewall_name = azurerm_firewall.azure_firewall.name
  resource_group_name = var.resource_group_name
  priority            = each.value.priority
  action              = each.value.action

  dynamic "rule" {
    for_each = each.value.rules
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_addresses = rule.value.destination_addresses
      destination_ports     = rule.value.destination_ports
      protocols             = rule.value.protocols
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "app_rules" {
  for_each = var.app_rules

  name                = each.key
  azure_firewall_name = azurerm_firewall.azure_firewall.name
  resource_group_name = var.resource_group_name
  priority            = each.value.priority
  action              = each.value.action

  dynamic "rule" {
    for_each = each.value.rules
    content {
      name            = rule.value.name
      source_addresses = rule.value.source_addresses
      target_fqdns    = rule.value.target_fqdns
      protocols {
        port = rule.value.protocol_port
        type = rule.value.protocol_type
      }
    }
  }
}
