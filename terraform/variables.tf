variable "aws_cluster_name" {
  description = "What to call this cluster in AWS."
}

variable "aws_vpc_name" {
    description = "What to name your new VPC."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-1"
}

variable "resource_prefix" {
    description = "Something to prefix your resources with, like your initials."
}

variable "gcp_cluster_name" {
  description = "What to call this cluster in GCP."
}

variable "gcp_region" {
  description = "GCP region to launch servers."
  default     = "us-east1"
}

variable "gcp_project_id" {
  description = "The GCP project for this deployment."
}

variable "gcp_service_account_name" {
  description = "The service account name (before the '@') you are using for GCP"
}

variable "gcp_node_count" {
  default = 2
  description = "The number of nodes to add to the GCP cluster."
}
variable "gcp_network_name" {
  description = "The GCP network for this cluster"
}

