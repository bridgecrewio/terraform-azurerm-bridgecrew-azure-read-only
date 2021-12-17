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
