module "lambda_container" {
  source = "./modules/lambda_container"

  lambda_name        = var.lambda_name
  ecr_image_uri      = var.ecr_image_uri
  vpc_id             = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  environment_variables = var.environment_variables
  tags               = var.tags
}