resource "azurerm_container_group" "container_instances" {
  for_each = var.containers

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = each.value.os_type
  restart_policy      = each.value.restart_policy
  ip_address_type     = each.value.ip_address_type
  dns_name_label      = each.value.dns_name_label

  dynamic "container" {
    for_each = each.value.container_list
    content {
      name   = container.value.name
      image  = container.value.image
      cpu    = container.value.cpu
      memory = container.value.memory

      dynamic "ports" {
        for_each = container.value.ports
        content {
          port     = ports.value.port
          protocol = ports.value.protocol
        }
      }

      dynamic "environment_variables" {
        for_each = container.value.environment_variables
        content {
          name  = environment_variables.value.name
          value = environment_variables.value.value
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      container_group = each.value.name
    }
  )
}
