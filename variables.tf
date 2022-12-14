variable "org_name" {
  type        = string
  description = "The name of the org as registered in Bridgecrew console"
}

variable "bridgecrew_token" {
  type        = string
  sensitive   = true
  description = "Your authentication token as can be found in https://www.bridgecrew.cloud/integrations/azure-api-access"
}

variable "subscription_id" {
  type        = string
  description = "The subscription to connect. If left unspecified, the default subscription will be taken"
  default     = null
}

variable "extra_read_permissions_role_name" {
  type        = string
  default     = "bridgecrew-extra-read-permissions"
  description = "The name of the role that provides a few extra scanning permissions. You may need to provide a new name if you have multiple subscriptions sharing the same AD backend."
}

variable "bc_api_url" {
  type    = string
  default = "https://www.bridgecrew.cloud"
  description = "The API URL of Bridgecrew, supply a non-default value only when deploying it to a development/non-prod environment"
}
