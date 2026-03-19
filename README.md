# Azure Terraform Modules

A comprehensive collection of reusable Terraform modules for deploying Azure cloud infrastructure. This repository provides modular, scalable, and production-ready configurations for various Azure services.

## Table of Contents

- [Overview](#overview)
- [Module Architecture](#module-architecture)
- [Available Modules](#available-modules)
- [Module Descriptions](#module-descriptions)
- [Benefits of Using Terraform Modules](#benefits-of-using-terraform-modules)
- [Usage](#usage)
- [Module Architecture Diagram](#module-architecture-diagram)

## Overview

This repository contains a curated set of Terraform modules designed to simplify the deployment and management of Azure resources. Each module encapsulates the configuration for a specific Azure service, making it easier to create consistent, reusable, and maintainable infrastructure code.

### Key Features

- **Modular Design**: Each Azure service is isolated in its own module
- **Reusable**: Use the same modules across multiple projects and environments
- **Well-Documented**: Each module includes clear variable definitions and outputs
- **Production-Ready**: Follows Azure and Terraform best practices
- **Scalable**: Easy to extend and customize for your specific needs

---

## Module Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      AZURE CLOUD INFRASTRUCTURE                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐     │
│  │   Networking     │  │   Container &    │  │   Compute        │     │
│  │   (Foundation)   │  │   Registry       │  │   Services       │     │
│  ├──────────────────┤  ├──────────────────┤  ├──────────────────┤     │
│  │• Virtual Network │  │• Container Reg.  │  │• AKS Cluster     │     │
│  │• Subnets         │  │• Container Inst. │  │• Node Pools      │     │
│  │• Peering         │  │• Synapse         │  │• VMs (Linux/Win) │     │
│  │• Bastion Host    │  │                  │  │• Application GW  │     │
│  │• Firewall        │  │                  │  │• Data Factory    │     │
│  │• Private Endpoint│  │                  │  │                  │     │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘     │
│           │                     │                     │                │
│  ┌────────────────────┐  ┌──────────────────┐  ┌──────────────┐       │
│  │   Security &       │  │   Data & Logging │  │   Analytics  │       │
│  │   Storage          │  │                  │  │   & Services │       │
│  ├────────────────────┤  ├──────────────────┤  ├──────────────┤       │
│  │• Key Vault         │  │• SQL Server      │  │• Log Analytics│      │
│  │                    │  │• Log Analytics   │  │• Power BI    │       │
│  └────────────────────┘  └──────────────────┘  └──────────────┘       │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Available Modules

| Module | Purpose |
|--------|---------|
| [aks](#aks) | Azure Kubernetes Service for container orchestration |
| [aks_agent_pool](#aks_agent_pool) | Additional node pools for AKS clusters |
| [application_gateway](#application_gateway) | Application load balancer and web application firewall |
| [azure_container_instances](#azure_container_instances) | Serverless container execution |
| [azure_firewall](#azure_firewall) | Managed firewall for virtual networks |
| [bastion_host](#bastion_host) | Secure bastion host for VM access |
| [container_registry](#container_registry) | Container image registry and storage |
| [data_factory](#data_factory) | Data integration and ETL orchestration |
| [key_vault](#key_vault) | Secrets and certificate management |
| [log_analytics_workspace](#log_analytics_workspace) | Log aggregation and monitoring |
| [power_bi](#power_bi) | Business intelligence and analytics |
| [private_endpoint](#private_endpoint) | Private connectivity to Azure services |
| [sql_server](#sql_server) | Managed SQL Server database |
| [synapse_workspace](#synapse_workspace) | Analytics, data warehousing, and big data |
| [virtual_machine_linux](#virtual_machine_linux) | Linux virtual machine compute |
| [virtual_machine_windows](#virtual_machine_windows) | Windows virtual machine compute |
| [virtual_network](#virtual_network) | Network foundation and connectivity |
| [virtual_network_peering](#virtual_network_peering) | Network-to-network connectivity |

---

## Module Descriptions

### **Networking Modules**

#### virtual_network
Creates the foundation for Azure cloud infrastructure. Configures virtual networks, subnets, and address spaces for secure network segmentation.

#### virtual_network_peering
Establishes direct network-to-network connections between Azure virtual networks, enabling seamless communication across peered networks.

#### bastion_host
Provides secure RDP and SSH access to virtual machines without exposing them to the public internet through a secure bastion host.

#### azure_firewall
Implements a stateful managed firewall to control ingress and egress traffic, protect virtual networks, and enforce security policies.

#### private_endpoint
Creates private connections to Azure services, allowing secure, low-latency access without exposing services to public internet.

---

### **Container & Container Services Modules**

#### container_registry
Manages a private container registry for storing, managing, and deploying Docker container images.

#### azure_container_instances
Runs containerized applications without managing virtual machines, providing serverless container execution.

#### synapse_workspace
Unified analytics platform combining data warehousing, big data analytics, and data integration capabilities.

---

### **Kubernetes & Orchestration Modules**

#### aks
Deploys a fully managed Kubernetes cluster with integrated container orchestration, auto-scaling, and enterprise-grade security.

#### aks_agent_pool
Adds additional node pools to AKS clusters for specialized workloads, different VM sizes, or node-specific configurations.

---

### **Compute & Application Delivery Modules**

#### virtual_machine_linux
Provisions Linux virtual machines with customizable configurations for database servers, application servers, or general-purpose compute.

#### virtual_machine_windows
Deploys Windows virtual machines for workloads requiring Windows OS, including domain-joined scenarios.

#### application_gateway
Advanced load balancer and web application firewall providing intelligent traffic distribution, SSL termination, and security policies.

---

### **Data, Storage & Management Modules**

#### sql_server
Managed SQL Server database service providing enterprise-grade relational databases with automated backups and built-in security.

#### data_factory
Cloud-based ETL and data integration service for orchestrating data pipelines, transformations, and movement.

#### key_vault
Centralized secrets management for storing encryption keys, passwords, certificates, and sensitive configuration data.

#### log_analytics_workspace
Centralizes logs and metrics from all Azure resources for monitoring, alerting, and diagnostics.

---

### **Analytics & Business Intelligence Modules**

#### power_bi
Embedded Power BI capacity for building and hosting interactive reports and dashboards.

---

## Benefits of Using Terraform Modules

### 1. **Code Reusability**
- Write infrastructure code once and use it across multiple projects
- Reduces code duplication and maintenance burden
- Consistent configurations across environments

### 2. **Abstraction & Simplification**
- Hide complexity behind simple module inputs
- Users don't need to understand all Azure resource details
- Faster deployment for common infrastructure patterns

### 3. **Consistency & Standards**
- Enforce organizational best practices automatically
- Ensure all resources follow security and compliance standards
- Reduce configuration drift and human errors

### 4. **Modularity & Scalability**
- Compose complex infrastructure from simple building blocks
- Easy to add, remove, or modify components
- Scales from simple to enterprise-level deployments

### 5. **Maintainability**
- Centralized update points for resource configurations
- Changes propagate automatically to all deployments
- Easier troubleshooting and debugging

### 6. **Collaboration**
- Teams can create shared infrastructure libraries
- Lower learning curve for new team members
- Clear documentation and standardized interfaces

### 7. **Cost Optimization**
- Standardized configurations prevent resource waste
- Easy to experiment with different resource sizes
- Version control enables rollback of expensive changes

### 8. **Disaster Recovery & High Availability**
- Quickly recreate infrastructure in different regions
- Implement consistent HA configurations across deployments
- Easy environment parity between development and production

---

## Usage

Each module can be used independently or combined with other modules. Here's a basic example:

```hcl
module "virtual_network" {
  source = "./virtual_network"
  
  vnet_name           = "prod-vnet"
  location            = "eastus"
  resource_group_name = "prod-rg"
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
}

module "aks" {
  source = "./aks"
  
  cluster_name        = "prod-aks"
  location            = module.virtual_network.location
  resource_group_name = module.virtual_network.resource_group_name
  subnet_id           = module.virtual_network.subnet_id
  
  kubernetes_version = "1.27"
  node_count        = 3
  vm_size           = "Standard_DS2_v2"
  
  depends_on = [module.virtual_network]
}
```

### Key Variables in Each Module

Each module includes:
- **variables.tf**: Input variables with descriptions and validation
- **main.tf**: Resource definitions
- **output.tf**: Exported values for use in other modules

### Module Composition

Modules can depend on each other and pass outputs as inputs:

```hcl
# Networking foundation
module "network" {
  source = "./virtual_network"
  # ... configuration
}

# Container registry
module "acr" {
  source = "./container_registry"
  # ... configuration
}

# Kubernetes cluster using the network
module "kubernetes" {
  source        = "./aks"
  subnet_id     = module.network.subnet_id
  # ... configuration
  
  depends_on = [module.network]
}
```

---

## Best Practices

1. **Use Variables**: Leverage module variables for flexibility
2. **Document Inputs**: Clearly describe what each variable does
3. **Provide Outputs**: Export important values for downstream modules
4. **Add Validation**: Use variable validation rules to catch errors early
5. **Version Your Modules**: Track changes and maintain compatibility
6. **Test Modules**: Validate configurations before using in production
7. **Use Tags**: Apply consistent tagging for resource organization and billing

---

## Contributing

When adding new modules:
1. Follow the module structure (main.tf, variables.tf, output.tf)
2. Include comprehensive variable descriptions
3. Export all relevant resource identifiers
4. Document the module's purpose and usage
5. Add examples and use cases

---

## License

Please refer to your organization's licensing requirements.

---

**Last Updated**: March 2026
