variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "key_name" {
  description = "AWS SSH key pair"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "node_count" {
  description = "Number of Kubernetes nodes"
  type        = number
}