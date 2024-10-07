resource "aws_cloudwatch_log_group" "github_runner_logs" {
  name              = "/aws/ec2/github-runner"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "HighCPUUsage"
  alarm_description   = "This alarm triggers when CPU usage exceeds 80%"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  dimensions          = {
    InstanceId = aws_instance.github_runner.id
  }
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 1
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [] # Add your SNS Topic ARN here
}
