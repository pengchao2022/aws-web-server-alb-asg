output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.nginx_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the ALB"
  value       = aws_lb.nginx_alb.zone_id
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.nginx_tg.arn
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.nginx_asg.name
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.nginx_lt.id
}
