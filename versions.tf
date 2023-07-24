terraform {
    required_providers {
        aviatrix = {
            source  = "aviatrixsystems/aviatrix"
            # version = "~>3.0.0" # v.7.x
            version = "~> 2.23.0" # v.6.8
        }
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
    required_version = ">= 1.0"
}