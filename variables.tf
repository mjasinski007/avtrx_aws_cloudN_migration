variable "aws_profile" {
    type = string
}

variable "aws_us_region" {
    type = string
}

variable "ctrl_username" {
    type = string
}

variable "ctrl_password" {
    type = string
}

variable "ctrl_ip" {
    type = string
}

# AWS/Aviatrix Controller Account
variable "aws_ctrl_account_name" {
    type = string
}

variable "cloud_type" {
    type = string
}

variable "transit150_cidr" {
    type = string
}

variable "transit150_vpc_name" {
    type = string
}

variable "transit150_gw_name" {
    type = string
}

variable "transit150_instance_type" {
    type = string
}

variable "transit150_local_as_number" {
    type = string
}


variable "spoke10_cidr" {
    type = string
}

variable "spoke10_vpc_name" {
    type = string
}

variable "spoke10_gw_name" {
    type = string
}

variable "spoke10_instance_size" {
    type = string
}

variable "spoke10_local_as_number" {
    type = string
}

variable "spoke20_cidr" {
    type = string
}

variable "spoke20_vpc_name" {
    type = string
}

variable "spoke20_gw_name" {
    type = string
}

variable "spoke20_instance_size" {
    type = string
}

variable "spoke20_local_as_number" {
    type = string
}


variable "createdby" {
    type = string
}

variable "environment" {
    type = string
}

variable "maintainedby" {
    type = string
}

variable "owner" {
    type = string
}

variable "repository" {
    type = string
}