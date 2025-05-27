variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "rexloc" {
  description = "Resource Location"
  type        = string
}

variable "rexgpName" {
  description = "Resource Group Name"
  type        = string
}

