variable "stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}

variable "region1" {
  type        = string
  description = "First region for stack deployment"
}

variable "region2" {
  type        = string
  description = "Second region for stack deployment"
}

variable "topic_name" {
type        = string
description = "Name of SNS topic"
}