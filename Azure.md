# Azure ReadOnly Deployment Module
This module allows you to connect your Azure subscription to [Bridgecrew Cloud](https://bridgecrew.cloud)

## Configuration
```hcl-terraform
module "bridgecrew-azure" {
  source          = "bridgecrewio/read-only/azure"
  subscription_id = "your-subscription-id"
}
```

## Variables and Outputs
### Variables
The module gets a single variable as input, which is required - `subscription_id`.

### Outputs

|name|description|example|
|----|-----------|-------|
|subscription_id|The Subscription ID this module was deployed to|62f5e458-9e12-40c9-a1b4-23badcdd19ca|
|tenant_id | The ID of the tenant as described by Azure | 1f668476-63d2-4f30-8fa1-976303c32b40|
|client_id|The ID of the Service Principal's Application ID | d02f970f-e10e-4249-9960-0d959b246579|
|client_secret|The secret that was generated for this Service Principal||