provider "aws" {
    profile = var.aws_profile
    region  = var.aws_us_region
}

provider "aviatrix" {
    controller_ip = var.ctrl_ip
    username      = var.ctrl_username
    password      = var.ctrl_password
    skip_version_validation = true
}