
variable "rg_location" {
  description = "Location of the resource group"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sa_web_name" {
  description = "Name of the web storage account"
  type        = string
}

variable "sc_name" {
  description = "Name of the storage container"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to use"
  type        = string
  sensitive   = true
}

# Web

variable "index_document" {
  description = "Name of the index document"
  type        = string
}
