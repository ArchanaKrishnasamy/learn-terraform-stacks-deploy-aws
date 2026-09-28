# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 6.14.1"
  }
  tls = {
    source  = "hashicorp/tls"
    version = "~> 4.1.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }
}

provider "aws" "this" {
  for_each = var.regions

  config {
    region = each.value
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
    token      = var.aws_session_token

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "tls" "this" {}

provider "random" "this" {
}
