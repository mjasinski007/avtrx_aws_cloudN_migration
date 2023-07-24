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

###################
### Spope 10 VM ###
###################


variable "spoke10_vm_instance_name" {
    type        = string
    description = "EC2 instance name"
}

variable "spoke10_vm_instance_type" {
    type        = string
    description = "EC2 instance type"
}

variable "spoke10_vm_associate_public_ip_address" {
    type        = bool
    description = "Associate a public IP address to the EC2 instance"
}

variable "spoke10_vm_root_volume_size" {
    type        = number
    description = "Root Volume size of the EC2 Instance"
}

variable "spoke10_vm_root_volume_type" {
    type        = string
    description = "Root volume type of the EC2 Instance"
}


variable "spoke20_vm_instance_name" {
    type        = string
    description = "EC2 instance name"
}

variable "spoke20_vm_instance_type" {
    type        = string
    description = "EC2 instance type"
}

variable "spoke20_vm_associate_public_ip_address" {
    type        = bool
    description = "Associate a public IP address to the EC2 instance"
}

variable "spoke20_vm_root_volume_size" {
    type        = number
    description = "Root Volume size of the EC2 Instance"
}

variable "spoke20_vm_root_volume_type" {
    type        = string
    description = "Root volume type of the EC2 Instance"
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

