resource "azurerm_public_ip" "appgw_pip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = "appgw-frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name                = each.key
      data                = try(each.value.data, null)
      key_vault_secret_id = try(each.value.key_vault_secret_id, null)
    }
  }

  dynamic "frontend_port" {
    for_each = var.frontend_ports
    content {
      name = each.key
      port = each.value.port
    }
  }

  dynamic "backend_address_pool" {
    for_each = var.backend_pools
    content {
      name = each.key
      backend_address = try(each.value.backend_addresses, [])
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.http_settings
    content {
      name                  = each.key
      cookie_based_affinity = each.value.cookie_based_affinity
      port                  = each.value.port
      protocol              = each.value.protocol
      request_timeout       = each.value.request_timeout
    }
  }

  dynamic "http_listener" {
    for_each = var.listeners
    content {
      name                           = each.key
      frontend_ip_configuration_name = "appgw-frontend-ip"
      frontend_port_name             = each.value.frontend_port_name
      protocol                       = each.value.protocol
      ssl_certificate_name           = try(each.value.ssl_certificate_name, null)
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.routing_rules
    content {
      name                       = each.key
      rule_type                  = each.value.rule_type
      http_listener_name         = each.value.http_listener_name
      backend_address_pool_name  = try(each.value.backend_address_pool_name, null)
      backend_http_settings_name = try(each.value.backend_http_settings_name, null)
    }
  }

  tags = var.tags
}
