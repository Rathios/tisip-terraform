
locals {
  # Workspace
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  # Infrastructure
  rg_web_name = terraform.workspace == "default" ? var.rg_web_name : "${var.rg_web_name}-${local.workspace_suffix}"
  sa_web_name = terraform.workspace == "default" ? var.sa_web_name : "${var.sa_web_name}${local.workspace_suffix}"

  # Web content
  index_text  = "<h1>Web page created with Terraform. Environment: ${terraform.workspace}</h1>"
}
