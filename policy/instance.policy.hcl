policy {

}

resource_policy "aws_instance" "instance_type_validation" {
    locals {
        instance_type = core::try(attrs.instance_type, "")
    }
    enforce {
        condition = local.instance_type != "" && local.instance_type != "t2.micro"
        error_message = "Instance type must be specified and should not be t2.micro"
        info_message = "Instance type is valid: ${local.instance_type}"
    }
}

resource_policy "aws_instance" "vpc_validation" {
  locals {
    # Get the subnet ID from the instance
    subnet_id = core::try(attrs.subnet_id, "")
  }

  enforce {
    condition     = local.subnet_id == "" || local.vpc_exists
    info_message  = "EC2 instance is deployed in a valid VPC with subnet value ${local.subnet_id}"
    error_message = "EC2 instance's subnet does not belong to a defined VPC"
  }
}
