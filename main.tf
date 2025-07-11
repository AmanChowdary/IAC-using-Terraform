module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  cidr_block      = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "iam" {
  source        = "./modules/iam"
  iam_user_name = var.iam_user_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}

module "rds" {
  source        = "./modules/rds"
  db_identifier = var.db_identifier
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
  subnet_ids    = module.vpc.private_subnet_ids
  vpc_id        = module.vpc.vpc_id
  allowed_cidrs = ["10.0.0.0/16"]
}

module "alb" {
  source              = "./modules/alb"
  alb_name            = var.alb_name
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.public_subnet_ids
  target_instance_ids = module.ec2.instance_ids
}

module "ec2" {
  source               = "./modules/ec2"
  instance_count       = var.instance_count
  instance_type        = var.instance_type
  subnet_id            = module.vpc.public_subnet_ids[0]
  iam_instance_profile = module.iam.instance_profile_name
  key_name             = var.key_name
  vpc_id               = module.vpc.vpc_id
} 