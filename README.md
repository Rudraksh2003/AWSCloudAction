# AWSCloudAction - Terraform Module: GitHub Actions Runner on AWS

This Terraform module automates the deployment of a self-hosted GitHub Actions runner on Amazon Web Services (AWS). It provisions an EC2 instance, installs the GitHub Actions runner, and configures logging and monitoring using Amazon CloudWatch.

## Features

- **Automated Deployment**: Quickly set up a GitHub Actions runner on AWS.
- **Monitoring & Logging**: Integrated with Amazon CloudWatch for monitoring and logging.
- **IAM Role Management**: Automatically creates an IAM role with necessary permissions for the runner.
- **Customizable**: Easily modify configurations to suit your needs.

## Prerequisites

- **Terraform**: Ensure you have [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- **AWS Account**: You need an AWS account with sufficient permissions to create EC2 instances and IAM roles.
- **GitHub Token**: Generate a personal access token with `repo` and `workflow` permissions from your GitHub account. Replace `YOUR_TOKEN` in the configuration with this token.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
   cd YOUR_REPOSITORY
   ```

2. **Update Variables**:
   Modify the `main.tf` file to replace:
   - `YOUR_USERNAME`: Your GitHub username.
   - `YOUR_REPOSITORY`: The name of your GitHub repository.
   - `YOUR_TOKEN`: Your GitHub personal access token.

3. **Initialize Terraform**:
   Run the following command to initialize the Terraform workspace:
   ```bash
   terraform init
   ```

4. **Plan the Deployment**:
   Generate an execution plan to preview the changes:
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   Deploy the GitHub Actions runner:
   ```bash
   terraform apply
   ```

   Confirm the action by typing `yes` when prompted.

6. **Access the Runner**:
   After deployment, you can find the public IP of the instance in the output. You can use this IP to connect to your runner if needed.

## Monitoring

The module configures Amazon CloudWatch to monitor the runner's performance. You can view logs and metrics in the [CloudWatch Console](https://console.aws.amazon.com/cloudwatch/home).

### CloudWatch Alarms

The module includes an alarm for high CPU usage. You can customize this to add more alarms based on your requirements.

## Cleanup

To remove all resources created by this module, run:
```bash
terraform destroy
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please create a pull request or open an issue for any enhancements or bug fixes.

