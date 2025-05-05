
locals {
  # Workspace
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  # Infrastructure
  rg_name     = "${var.rg_name}-${local.workspaces_suffix}"
  sa_web_name = "${var.sa_web_name}${random_string.random_string.result}${local.workspaces_suffix}"

  # Web
  index_text  = "Web page created with Terraform. Environment: ${terraform.workspace}"
}
