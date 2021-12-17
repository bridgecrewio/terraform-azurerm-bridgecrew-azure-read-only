resource "random_string" "password" {
  length      = 24
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
  special     = false
}
