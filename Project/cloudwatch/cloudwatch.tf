resource "aws_cloudwatch_dashboard" "zj_dashboard_new" {
  dashboard_name = "zj_dashboard_new"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              var.ec2_id
            ]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "CPU Utilization"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkIn",
              "InstanceId",
               var.ec2_id
            ]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "NetworkIn"
        }
      }
    ]
  })
}