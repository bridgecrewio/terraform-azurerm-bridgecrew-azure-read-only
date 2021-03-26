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
  org_name         = "acme"
  bridgecrew_token = "YOUR_TOKEN"
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

No requirements.

## Providers

| Name | Version |
|------|---------|
| azuread | n/a |
| azurerm | n/a |
| null | n/a |
| random | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [azuread_application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) |
| [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) |
| [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) |
| [azuread_service_principal_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password) |
| [azurerm_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) |
| [azurerm_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bridgecrew\_token | Your authentication token as can be found in https://www.bridgecrew.cloud/integrations/azure-api-access | `string` | n/a | yes |
| org\_name | The name of the org as registered in Bridgecrew console | `string` | n/a | yes |
| subscription\_id | The subscription to connect. If left unspecified, the default subscription will be taken | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| bridgecrew\_output | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
