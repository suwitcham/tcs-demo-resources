
locals {
  cognito_user_pool_name = "user-pool-${random_string.uniq.result}"
}

## Creates User Pool
resource "aws_cognito_user_pool" "pool" {
  name = local.cognito_user_pool_name

  auto_verified_attributes = [
    "email",
  ]

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  tags = local.project_tags

  password_policy {
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 90
    minimum_length                   = 14
    require_lowercase                = true
  }

  password_policy {
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 90
    minimum_length                   = 14
  }

  password_policy {
    require_uppercase                = true
    temporary_password_validity_days = 90
    minimum_length                   = 14
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
  }

  password_policy {
    minimum_length                   = 14
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 90
  }

  password_policy {
    minimum_length                   = 14
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 90
  }

  password_policy {
    temporary_password_validity_days = 90
    minimum_length                   = 14
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
  }
}

resource "aws_cognito_user_pool_client" "app_client" {
  name = var.cognito_app_name

  user_pool_id    = aws_cognito_user_pool.pool.id
  generate_secret = false

  supported_identity_providers = ["COGNITO"]


}