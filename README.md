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

This project is **modularized**, with separate Terraform modules for the VPC, subnet, and EC2 instance, demonstrating best practices in resource organization and reusability.

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

1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads).  
2. Configure AWS CLI with your credentials.  
3. Navigate to the project folder and run:

```bash
terraform init
terraform plan
terraform apply
Use the EC2 public IP output to access the instance.

Project Structure
perl
Copy
Edit
my-vpc-project/
├── main.tf          # Root module calling submodules
├── variables.tf     # Input variables
├── outputs.tf       # Project outputs
├── README.md        # Documentation
├── .gitignore       # Ignore Terraform state and sensitive files
├── modules/
│   ├── vpc/         # VPC resources
│   ├── subnet/      # Subnet resources
│   └── ec2/         # EC2 instance resources
Skills Demonstrated
AWS VPC design and networking basics

Subnet planning and routing

Security group configuration

EC2 provisioning

Infrastructure as Code with Terraform

Modular Terraform project organization
