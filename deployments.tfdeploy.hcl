# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::907651659844:role/stacks-archana-test-org-test-archana-project"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "dev"
    }
  }
  destroy = false
}

# deployment "production" {
#   inputs = {
#     regions        = ["us-east-1", "us-west-1"]
#     role_arn       = "arn:aws:iam::907651659844:role/stacks-archana-test-org-test-archana-project"
#     identity_token = identity_token.aws.jwt
#     default_tags = {
#       Stack       = "learn-stacks-deploy-aws",
#       Environment = "prod"
#     }
#   }
#   destroy = false
# }
