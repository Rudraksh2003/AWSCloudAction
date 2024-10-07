resource "aws_instance" "github_runner" {
  ami           = "ami-0c55b159cbfafe1f0" # Update this with the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet.id

  security_groups = [
    aws_security_group.github_runner_sg.name
  ]

  iam_instance_profile = aws_iam_role.github_runner_role.name

  tags = {
    Name = var.runner_name
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ec2-user && mkdir actions-runner && cd actions-runner",
      "curl -o actions-runner-linux-x64-2.283.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.283.0/actions-runner-linux-x64-2.283.0.tar.gz",
      "tar xzf ./actions-runner-linux-x64-2.283.0.tar.gz",
      "./bin/installdependencies.sh",
      "./config.sh --url https://github.com/YOUR_USERNAME/YOUR_REPOSITORY --token ${var.github_token}",
      "sudo ./svc.sh install",
      "sudo ./svc.sh start",
    ]
  }
}
