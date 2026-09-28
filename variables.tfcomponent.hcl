# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  description = "AWS regions to deploy to."
  type        = set(string)
}


variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "learn-stacks-deploy-aws",
    Environment = "dev"
  }
}
