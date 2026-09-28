# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  description = "AWS regions to deploy to."
  type        = set(string)
}

variable "aws_access_key_id" {
  type      = string
  sensitive = true
  ephemeral = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
  ephemeral = true
}

variable "aws_session_token" {
  type      = string
  sensitive = true
  ephemeral = true
}


variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "learn-stacks-deploy-aws",
    Environment = "dev"
  }
}
