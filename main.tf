provider "aws" {
  region = var.aws_region
}

# Call VPC module
module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr
}

# Call Subnet module
module "public_subnet" {
  source    = "./modules/subnet"
  vpc_id    = module.vpc.vpc_id
  cidr_block = var.public_subnet_cidr
}

# Call EC2 module
module "web_instance" {
  source               = "./modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = module.public_subnet.subnet_id
  security_group_id    = var.web_sg_id
}
