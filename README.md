# AWSCloudAction - Terraform Module: GitHub Actions Runner on AWS
---

![Deploy GitHub Actions Runners on AWS with Terraform](https://github.com/Rudraksh2003/AWSCloudAction/blob/main/Blue%20Pink%20Gradient%20Fashion%20Banner.png)
This Terraform module automates the deployment of a self-hosted GitHub Actions runner on Amazon Web Services (AWS). It provisions an EC2 instance, installs the GitHub Actions runner, and configures logging and monitoring using Amazon CloudWatch.
Creating a comprehensive project architecture for deploying GitHub Actions runners on AWS using Terraform involves detailing the components and their relationships. Here’s an overview of the architecture:

### Project Architecture Overview

1. **AWS Infrastructure**:
   - **VPC**: A Virtual Private Cloud to host the resources securely.
   - **Subnets**: Public and private subnets for organizing resources and enhancing security.
   - **EC2 Instance**: The main resource, an Amazon EC2 instance running the GitHub Actions runner.
   - **Security Group**: A security group that controls inbound and outbound traffic to the EC2 instance.
   - **IAM Role**: An IAM role associated with the EC2 instance that grants permissions for logging and monitoring.

2. **Monitoring & Logging**:
   - **CloudWatch Logs**: For capturing logs from the GitHub Actions runner.
   - **CloudWatch Metrics**: For monitoring performance metrics such as CPU and memory usage.
   - **CloudWatch Alarms**: For setting thresholds and notifications based on resource usage.

3. **GitHub Integration**:
   - **GitHub Actions**: The CI/CD tool that will use the self-hosted runner for executing workflows.

### Detailed Architecture Diagram

Here’s a textual representation of the architecture, which you can use to create a visual diagram with a tool like Lucidchart, Draw.io, or any diagramming tool of your choice.

```
[GitHub Repository]
        |
        |  (Triggers Workflows)
        v
[GitHub Actions]
        |
        |  (Uses Self-hosted Runner)
        v
[Amazon Cloud]
   +-----------------------------------------+
   |               VPC                       |
   |  +------------------------------+       |
   |  |         Subnet              |       |
   |  |      (Public/Private)       |       |
   |  |    +-------------------+     |       |
   |  |    |   EC2 Instance    |     |       |
   |  |    | (GitHub Runner)   |     |       |
   |  |    +-------------------+     |       |
   |  +------------------------------+       |
   |                                         |
   |  +------------------------------+       |
   |  |       Security Group         |       |
   |  +------------------------------+       |
   |                                         |
   |  +------------------------------+       |
   |  |        IAM Role             |       |
   |  +------------------------------+       |
   |                                         |
   |  +------------------------------+       |
   |  |      CloudWatch Logs         |       |
   |  +------------------------------+       |
   |                                         |
   |  +------------------------------+       |
   |  |      CloudWatch Metrics      |       |
   |  +------------------------------+       |
   |                                         |
   |  +------------------------------+       |
   |  |      CloudWatch Alarms       |       |
   |  +------------------------------+       |
   +-----------------------------------------+
```

### Components Description

1. **GitHub Repository**: This is where your code resides, and GitHub Actions workflows are defined. It triggers jobs that run on the self-hosted runner.

2. **GitHub Actions**: Utilizes the self-hosted runner for executing CI/CD workflows, providing flexibility and control over the execution environment.

3. **VPC**: A secure network environment where all resources are deployed.

4. **Subnet**: Organizes resources within the VPC. Use public subnets for instances that need direct access to the internet and private subnets for backend services.

5. **EC2 Instance**: Hosts the self-hosted GitHub Actions runner. It runs jobs defined in your GitHub workflows.

6. **Security Group**: Defines the inbound and outbound traffic rules for the EC2 instance, ensuring only authorized access.

7. **IAM Role**: Grants necessary permissions for the EC2 instance to interact with AWS services, such as CloudWatch for logging and monitoring.

8. **CloudWatch Logs**: Captures logs from the GitHub Actions runner for troubleshooting and auditing.

9. **CloudWatch Metrics**: Monitors resource usage metrics (e.g., CPU, memory) to keep track of performance.

10. **CloudWatch Alarms**: Sends notifications when thresholds are exceeded, allowing proactive management of resources.

### Deployment Process

1. **Initialization**: Terraform initializes the project and creates the necessary state files.
2. **Configuration**: The user modifies Terraform configurations as needed, specifying the GitHub repository details and runner configurations.
3. **Resource Creation**: Terraform provisions the specified AWS resources, including the VPC, EC2 instance, IAM role, and CloudWatch configuration.
4. **Runner Configuration**: The EC2 instance is configured to run the GitHub Actions runner and send logs to CloudWatch.
5. **Monitoring Setup**: CloudWatch is set up to monitor logs, metrics, and alarms based on the EC2 instance's performance.


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

