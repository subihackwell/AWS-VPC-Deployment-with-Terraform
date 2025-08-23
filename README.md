# AWS VPC Deployment with Terraform

This project demonstrates professional Infrastructure as Code (IaC) practices by provisioning a fully functional AWS Virtual Private Cloud (VPC) environment using Terraform.

## Project Overview

The infrastructure created by this project includes:

- A custom VPC
- Public subnet
- Internet Gateway (IGW)
- Route table with internet access
- Security group configured for SSH and HTTP access
- EC2 instance within the public subnet

This project is structured modularly, separating resources into dedicated Terraform files for readability and maintainability.

## Features

- Fully automated VPC deployment using Terraform
- Professional modular file structure
- Reusable variables for region, CIDR blocks, instance types, and AMI
- Outputs for key resources such as EC2 public IP and VPC ID
- Safe for GitHub: no sensitive information included

## Getting Started

1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
2. Configure AWS CLI with your credentials
3. Run the following commands in your project folder:

```bash
terraform init
terraform plan
terraform apply

