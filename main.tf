provider "aws" {
  region = var.aws_region
}

# Call the EC2 module
module "web_instance" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  subnet_id     = aws_subnet.public.id
  instance_type = var.instance_type
}
