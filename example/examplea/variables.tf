variable "org_name" {
  type        = string
  description = "The name of the org as registered in Bridgecrew console"
}

variable "bridgecrew_token" {
  type        = string
  sensitive   = true
  description = "Your authentication token as can be created here https://www.bridgecrew.cloud/integrations"
}
