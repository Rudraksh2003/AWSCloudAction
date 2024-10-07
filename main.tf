provider "aws" {
  region = "us-east-1"  # Adjust as needed
}

resource "aws_instance" "github_runner" {
  ami           = "ami-0123456789abcdef0"  # Replace with a suitable AMI ID
  instance_type = "t2.micro"               # Adjust instance type as needed

  iam_instance_profile = aws_iam_instance_profile.github_runner_profile.name

  user_data = <<-EOF
              #!/bin/bash
              # Install necessary packages
              sudo yum update -y
              sudo yum install -y git

              # Download and configure the GitHub Actions runner
              mkdir actions-runner && cd actions-runner
              curl -O https://github.com/actions/runner/releases/latest/download/actions-runner-linux-x64-2.x.x.tar.gz
              tar xzf ./actions-runner-linux-x64-2.x.x.tar.gz
              ./config.sh --url https://github.com/YOUR_USERNAME/YOUR_REPOSITORY --token YOUR_TOKEN

              # Run the GitHub Actions runner
              ./run.sh
              EOF

  tags = {
    Name = "GitHub Runner"
  }
}

resource "aws_iam_role" "github_runner_role" {
  name = "github-runner-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_instance_profile" "github_runner_profile" {
  name = "github-runner-profile"
  role = aws_iam_role.github_runner_role.name
}

output "instance_public_ip" {
  value = aws_instance.github_runner.public_ip
}
