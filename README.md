# AWS VPC Deployment with Terraform

This project demonstrates professional Infrastructure as Code (IaC) practices by provisioning a fully functional AWS Virtual Private Cloud (VPC) environment using Terraform.

## Project Overview

The infrastructure created by this project includes:

- **Custom VPC** – Provides a private, isolated network within AWS.
- **Public Subnet** – Hosts resources accessible from the internet, such as a web server.
- **Internet Gateway (IGW)** – Enables internet access for resources in the public subnet.
- **Route Table** – Routes traffic from the subnet to the internet via the IGW.
- **Security Group** – Controls inbound and outbound traffic; allows SSH (port 22) and HTTP (port 80) for the web server.
- **EC2 Instance** – Deployed within the public subnet as a web server.

This project is **modularized**, with separate Terraform modules for the VPC, subnet, and EC2 instance, causing it to be proficient in resource organization and reusability.

---

## Variables

The project uses input variables for flexibility:

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resource deployment | `us-east-1` |
| `vpc_cidr` | CIDR block for the VPC | `10.0.0.0/16` |
| `public_subnet_cidr` | CIDR block for the public subnet | `10.0.1.0/24` |
| `instance_type` | EC2 instance type (Free Tier eligible) | `t3.micro` |
| `ami_id` | AMI ID for the EC2 instance | Amazon Linux 2 AMI in us-east-1 |
| `web_sg_id` | Security Group ID for EC2 instance | N/A, assigned in root module |

**Design reasoning:**  

- Initially used t2 micro instance type redirected due to paid tier.
- Using **variables** allows quick changes to regions, CIDR blocks, and instance types without editing the main code.  
- Separating **subnets** and **modules** makes it easier to scale the infrastructure, e.g., adding private subnets or more EC2 instances.  
- The **public subnet** is mapped to auto-assign public IPs so the EC2 instance is reachable from the internet for demonstration purposes.

---

## Outputs

After applying Terraform, the following outputs are available:

- `ec2_public_ip` – The public IP of the deployed EC2 instance.  
- `vpc_id` – The unique ID of the created VPC.  
- `public_subnet_id` – The ID of the public subnet.

These outputs make it easy to reference and manage deployed resources.

---

## Getting Started

Install Terraform
[Terraform Download](https://developer.hashicorp.com/terraform/downloads)

### Configure AWS CLI
```bash
aws configure
```
### Initialize Terraform
```bash
terraform init
```
### Plan Terraform Deployment
```bash
terraform plan
```
### Apply Terraform Deployment
```bash
terraform apply
```
Access the EC2 Instance

Use the ec2_public_ip output from Terraform to connect to the instance.

#⚡ CI/CD Pipeline 

Automate deployments with GitHub Actions so your infrastructure updates automatically when you push changes.

Example Workflow
```bash
Create .github/workflows/terraform.yml:

name: Terraform CI/CD

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: 1.5.0

      - run: terraform init
      - run: terraform plan
      - run: terraform apply -auto-approve
        if: github.ref == 'refs/heads/main'
```

Make sure to store AWS credentials securely using GitHub Secrets.

This ensures repeatable, reliable deployments without manual intervention.


# Skills Demonstrated

- AWS VPC design and networking basics

- Subnet planning and routing

- Security group configuration

- EC2 provisioning

- Infrastructure as Code (IaC) using Terraform

- Modular Terraform project organization

- Automating deployments with CI/CD



