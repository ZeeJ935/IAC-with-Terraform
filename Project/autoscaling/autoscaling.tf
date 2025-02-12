resource "aws_launch_configuration" "zj_launch_configuration" {
  name          = "zj-launch-configuration"
  image_id      = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name       = var.key_name
  security_groups = var.security_group_ids
}

resource "aws_autoscaling_group" "zj_asg" {
  desired_capacity     = 1
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.zj_launch_configuration.id
  health_check_type    = "EC2"
  health_check_grace_period = 300
  tag {
    key                 = "Name"
    value               = "zj-auto-scaling-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "zj_scale_out" {
  name                   = "zj_scale_out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.zj_asg.name
}

resource "aws_autoscaling_policy" "zj_scale_in" {
  name                   = "zj_scale_in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.zj_asg.name
}
