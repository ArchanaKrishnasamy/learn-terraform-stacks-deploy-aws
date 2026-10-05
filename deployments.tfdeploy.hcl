# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

store "varset" "aws_credentials" {
  id     = "varset-PNnzBJa6ZPmLArds"
  category = "env"
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    aws_access_key_id     = store.varset.aws_credentials.AWS_ACCESS_KEY_ID
    aws_secret_access_key = store.varset.aws_credentials.AWS_SECRET_ACCESS_KEY
    aws_session_token     = store.varset.aws_credentials.AWS_SESSION_TOKEN
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