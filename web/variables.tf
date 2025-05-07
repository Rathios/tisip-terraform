
variable "rg_web_location" {
  description = "Location of the web resource group"
  type        = string
  default     = "westeurope"
}

variable "rg_web_name" {
  description = "Name of the web resource group"
  type        = string
  default     = "rg-web"
}

variable "sa_web_name" {
  description = "Name of the web storage account"
  type        = string
  default     = "saweb"
}

# Web

variable "index_document" {
  description = "Name of the index document"
  type        = string
  default     = "index.html"
}
