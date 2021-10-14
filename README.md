# Bridgecrew AZURE ReadOnly Integration

[![Maintained by Bridgecrew.io](https://img.shields.io/badge/maintained%20by-bridgecrew.io-blueviolet)](https://bridgecrew.io)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/bridgecrewio/terraform-azurerm-read-only.svg?label=latest)](https://github.com/bridgecrewio/terraform-azurerm-bridgecrew-read-only/releases/latest)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/bridgecrewio/terraform-azurerm-bridgecrew-azure-read-only/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fterraform-azurerm-bridgecrew-azure-read-only&benchmark=CIS+AZURE+V1.1)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg)

Implementing this module allows visibility to your azure subscription on [Bridgecrew Cloud](https://www.bridgecrew.cloud).

## Module contents

This module creates a an application registration in your subscription with a service principal for Bridgecrew to use.
The service principal requires the "Reader" role to function correctly.

## Configuration

### Prerequisites

This module requires the cURL library to be installed on your machine.
To check if you have cURL installed, type the following command in your terminal:

```shell script
curl --help
```

### Installation

To run this module, supply the name of the company as registered in [Bridgecrew Cloud](https://www.bridgecrew.cloud) as such:

```hcl-terraform
module "bridgecrew-read" {
  source           = "bridgecrewio/bridgecrew-azure-read-only/azure"
  org_name         = "<YOUR_ORG>"
  bridgecrew_token = "<YOUR_TOKEN>"
}
```

## Azure ReadOnly Deployment Module

This module allows you to connect your Azure subscription to [Bridgecrew Cloud](https://bridgecrew.cloud)

## Module

```hcl-terraform
module "bridgecrew-azure" {
  source          = "bridgecrewio/read-only/azure"
}
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.8 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.53.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 1.4.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.53.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.bridgecrew_app](https://registry.terraform.io/providers/hashicorp/azuread/1.4.0/docs/resources/application) | resource |
| [azuread_service_principal.bridgecrew_sp](https://registry.terraform.io/providers/hashicorp/azuread/1.4.0/docs/resources/service_principal) | resource |
| [azuread_service_principal_password.password](https://registry.terraform.io/providers/hashicorp/azuread/1.4.0/docs/resources/service_principal_password) | resource |
| [azurerm_role_assignment.role_assignments](https://registry.terraform.io/providers/hashicorp/azurerm/2.53.0/docs/resources/role_assignment) | resource |
| [null_resource.notify_bridgecrew](https://registry.terraform.io/providers/hashicorp/null/3.1.0/docs/resources/resource) | resource |
| [random_string.password](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/string) | resource |
| [azuread_service_principal.graph](https://registry.terraform.io/providers/hashicorp/azuread/1.4.0/docs/data-sources/service_principal) | data source |
| [azurerm_subscription.subscription](https://registry.terraform.io/providers/hashicorp/azurerm/2.53.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bridgecrew_token"></a> [bridgecrew\_token](#input\_bridgecrew\_token) | Your authentication token as can be found in https://www.bridgecrew.cloud/integrations/azure-api-access | `string` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | The name of the org as registered in Bridgecrew console | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription to connect. If left unspecified, the default subscription will be taken | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bridgecrew_output"></a> [bridgecrew\_output](#output\_bridgecrew\_output) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
