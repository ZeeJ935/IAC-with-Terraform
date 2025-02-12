resource "aws_cloudwatch_metric_alarm" "zj_cpu_alarm_new" {
  alarm_name          = "zj_cpu_alarm_new"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This alarm monitors when CPU utilization exceeds 80%"
  alarm_actions       = [var.scale_out_policy_arn]
}

resource "aws_cloudwatch_metric_alarm" "zj_cpu_low_alarm_new" {
  alarm_name          = "zj_cpu_low_alarm_new"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 20
  alarm_description   = "This alarm monitors when CPU utilization falls below 20%"
  alarm_actions       = [var.scale_in_policy_arn]
}
