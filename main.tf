terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

# Import other configuration files
module "iam_role" {
  source = "./iam.tf"
}

module "ec2_instance" {
  source = "./ec2.tf"
  iam_role = module.iam_role.iam_role_name
}

module "security_group" {
  source = "./security_group.tf"
}

module "cloudwatch" {
  source = "./cloudwatch.tf"
  instance_id = module.ec2_instance.instance_id
}


output "instance_public_ip" {
  value = aws_instance.github_runner.public_ip
}
