variable "region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "github_token" {
  description = "GitHub personal access token for authentication"
  type        = string
}

variable "runner_name" {
  description = "Name of the GitHub Actions runner"
  type        = string
  default     = "my-runner"
}
