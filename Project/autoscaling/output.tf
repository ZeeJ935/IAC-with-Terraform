output "scale_out_policy_arn" {
  description = "The ARN of the Auto Scaling scale-out policy"
  value       = aws_autoscaling_policy.zj_scale_out.arn
}

output "scale_in_policy_arn" {
  description = "The ARN of the Auto Scaling scale-in policy"
  value       = aws_autoscaling_policy.zj_scale_in.arn
}