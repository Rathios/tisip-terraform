
locals {
  # Base names using student prefix
  base_name = lower(var.student_name)

  # Resource specific names
  rg_name              = "${local.base_name}-${var.environment}-rg"
  app_service_plan     = "${local.base_name}-${var.environment}-asp"
  web_app_name         = "${local.base_name}-${var.environment}-webapp"
  sa_name = "${local.base_name}${random_string.sa_suffix.result}"
  app_insights_name    = "${local.base_name}-${var.environment}-appins"

  # Common tags
  common_tags = {
    environment = var.environment
    owner       = var.student_name
    cost-center = var.cost_center
    created-by  = "terraform"
  }
}
