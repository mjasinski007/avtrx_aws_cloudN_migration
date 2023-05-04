aws_profile           = "169444603265"
aws_us_region         = "us-west-1"

ctrl_username         = "admin"
ctrl_password         = "Its@secret!23"
ctrl_ip               = "3.10.92.20"
aws_ctrl_account_name = "avtx_aws_account"
cloud_type            = "aws"

transit150_cidr            = "10.150.0.0/16"
transit150_vpc_name        = "avtx-aws-transit150-vpc"
transit150_gw_name         = "avtx-aws-transit150-gw"
transit150_instance_type   = "t3.medium"
transit150_local_as_number = "65150"

spoke10_cidr            = "10.10.0.0/16"
spoke10_vpc_name        = "avtx-aws-spoke10-vpc"
spoke10_gw_name         = "avtx-aws-spoke10-gw"
spoke10_instance_size   = "t3.medium"
spoke10_local_as_number = "65010"

spoke20_cidr            = "10.20.0.0/16"
spoke20_vpc_name        = "avtx-aws-spoke20-vpc"
spoke20_gw_name         = "avtx-aws-spoke20-gw"
spoke20_instance_size   = "t3.medium"
spoke20_local_as_number = "65020"


createdby    = "TERRAFORM"
environment  = "Test CloudN"
maintainedby = "AVIATRIX"
owner        = "vMario"
repository   = "git@github.com:mjasinski007/avtrx_aws_cloudN_migration.git "