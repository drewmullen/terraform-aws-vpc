terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.68"
    }
  }
}

resource "test_assertions" "ipam_vpc_explicit_netmask" {
  component = "explicit_netmask"

  check "netmask" {
    description = "Validate the netmask of the CIDR derived from IPAM"
    condition   = regex("/28$", module.ipv4_ipam_explicit_netmask_vpc.vpc_cidr_block)
  }

  # check "netmask-should-fail" {
  #   description = "Validate the netmask of the CIDR derived from IPAM"
  #   condition   = false #regex("/29$", module.ipv4_ipam_explicit_netmask_vpc.vpc_cidr_block)
  # }
}
