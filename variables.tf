variable "org_name" {
  type        = string
  description = "The name of the org as registered in Bridgecrew console"
}

variable "bridgecrew_token" {
  type        = string
  description = "Your authentication token as can be found in https://www.bridgecrew.cloud/integrations/azure-api-access"
}

variable "base_url" {
  type        = string
  description = "Bridgecrew API base url"
  default     = "https://www.bridgecrew.cloud"
}

