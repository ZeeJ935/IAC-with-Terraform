resource "aws_lb_listener" "zjlistenernew" {
  load_balancer_arn = var.lb_id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.tg_id
  }

  tags = {
    Name = "zj-listener"
  }
}