variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
  default     = 1
}

variable "cpu_utilization_high" {
  description = "CPU utilization threshold for scaling out"
  type        = number
  default     = 70
}

variable "cpu_utilization_low" {
  description = "CPU utilization threshold for scaling in"
  type        = number
  default     = 30
}

variable "nginx_port" {
  description = "Nginx container port"
  type        = number
  default     = 80
}

variable "alb_port" {
  description = "ALB listener port"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Health check path for ALB"
  type        = string
  default     = "/"
}

variable "ssh_public_key" {
  description = "SSH public key for EC2 instances"
  type        = string
}