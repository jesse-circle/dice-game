variable "aws_cluster_name" {
  description = "What to call this cluster in AWS."
}

variable "aws_vpc_name" {
    description = "What to name your new VPC."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "resource_prefix" {
    description = "Something to prefix your resources with, like your initials."
}