resource "aws_lb_target_group" "zjtargetgroupnew" {
  name     = "zj-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_ids

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold    = 2
    unhealthy_threshold  = 2
  }

  tags = {
    Name = "zj-target-group"
  }
}