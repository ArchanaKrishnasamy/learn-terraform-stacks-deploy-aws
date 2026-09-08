# Copyright IBM Corp. 2025, 2026

policy {
  
  plugins {
    sample = {
      source = "../plugin/tfpolicy_binary"
    }
  }
}

resource_policy "*" "create_operation" {
  enforcement_level = "mandatory_overridable"
  filter = meta.operation == "create" && core::contains(["aws_instance", "random_string", "random_pet"], meta.type)
  locals {
    hello = plugin::sample::echo("Testing the plugin for resource")
  }

  enforce {
    condition     = true
    error_message = "Resource policy test: ${local.hello}"
    info_message  = "Tags. ${meta.tfe_workspace.tags.env}"
  }
}


resource_policy "*" "all_operation" {
  enforcement_level = "mandatory_overridable"
  filter = core::contains(["aws_instance", "random_string", "random_pet"], meta.type)
  locals {
    hello = plugin::sample::echo("Testing the plugin for resource")
  }

  enforce {
    condition     = true
    error_message = "Resource policy test: ${local.hello}"
    info_message  = "Tags. ${meta.tfe_workspace.tags.env}"
  }
}

provider_policy "*" "test_plugin" {
  filter = meta.type == "aws"
  locals {
    hello = plugin::sample::echo("Testing the plugin for provider")
  }

  enforce {
    condition     = true
    error_message = "Provider policy test: ${local.hello}"
  }
}

module_policy "*" "test_plugin" {
   filter = meta.source == "./modules/random"
  locals {
    hello = plugin::sample::echo("Testing the plugin for module")
  }

  enforce {
    condition     = true
    error_message = "Module policy test: ${local.hello}"
  }
}