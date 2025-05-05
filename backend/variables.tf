
variable "kv_backend_name" {
  description = "Name of the key vault for the backend"
  type        = string
}

variable "rg_backend_name" {
  description = "Name of the resource group for the backend"
  type        = string
}

variable "rg_backend_location" {
  description = "Location of the resource group for the backend"
  type        = string
}

variable "sa_backend_name" {
  description = "Name of the storage account for the backend"
  type        = string
}

variable "sa_backend_accesskey_name" {
  description = "Name of the storage account access key"
  type        = string
}

variable "sc_backend_name" {
  description = "Name of the storage container for the backend"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to use"
  type        = string
}
