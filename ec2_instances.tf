##################
#### Spoke 10 ####
##################


# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key_pair" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "spoke_10_key_pair" {
    key_name   = "spoke_10_key_pair"
    public_key = tls_private_key.key_pair.public_key_openssh
}
# Save file
resource "local_file" "spoke_10_ssh_key" {
    filename        = "${aws_key_pair.spoke_10_key_pair.key_name}.pem"
    content         = tls_private_key.key_pair.private_key_pem
    file_permission = "0400"
}

# Get latest Ubuntu Linux Focal Fossa 20.04 AMI
data "aws_ami" "ubuntu_linux_2004" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

# Define the security group for the EC2 Instance
resource "aws_security_group" "spoke10_ec2_nsg" {
    name        = "Spoke-10-NSG"
    description = "Allow incoming connections"
    vpc_id      = module.spoke_10.vpc.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH connections (Linux)"
    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH connections (Linux)"
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "spoke10_vm01" {
    ami                         = data.aws_ami.ubuntu_linux_2004.id
    instance_type               = var.spoke10_vm_instance_type
    subnet_id                   = module.spoke_10.vpc.public_subnets[0].subnet_id
    vpc_security_group_ids      = [aws_security_group.spoke10_ec2_nsg.id]
    source_dest_check           = false
    key_name                    = aws_key_pair.spoke_10_key_pair.key_name
    associate_public_ip_address = var.spoke10_vm_associate_public_ip_address
    user_data                   = file("ec2_bootstrap.sh")

    # root disk
    root_block_device {
        volume_size           = var.spoke10_vm_root_volume_size
        volume_type           = var.spoke10_vm_root_volume_type
        delete_on_termination = true
        encrypted             = true
    }

    tags = {
        Name = "UbntSpoke10-VM"
    }
}


# Create Elastic IP for the EC2 instance
resource "aws_eip" "spoke10_vm_eip" {
    vpc  = true
}

# Associate Elastic IP to the EC2 Instance
resource "aws_eip_association" "spoke10_vm_eip_association" {
    instance_id   = aws_instance.spoke10_vm01.id
    allocation_id = aws_eip.spoke10_vm_eip.id
}




##################
#### Spoke 20 ####
##################

# Create the Key Pair
resource "aws_key_pair" "spoke_20_key_pair" {
    key_name   = "spoke_20_key_pair"
    public_key = tls_private_key.key_pair.public_key_openssh
}
# Save file
resource "local_file" "spoke_20_ssh_key" {
    filename        = "${aws_key_pair.spoke_20_key_pair.key_name}.pem"
    content         = tls_private_key.key_pair.private_key_pem
    file_permission = "0400"
}

# Define the security group for the EC2 Instance
resource "aws_security_group" "spoke20_ec2_nsg" {
    name        = "Spoke20-NSG"
    description = "Allow incoming connections"
    vpc_id      = module.spoke_20.vpc.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH connections (Linux)"
    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH connections (Linux)"
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "spoke20_vm01" {
    ami                         = data.aws_ami.ubuntu_linux_2004.id
    instance_type               = var.spoke20_vm_instance_type
    subnet_id                   = module.spoke_20.vpc.public_subnets[0].subnet_id
    vpc_security_group_ids      = [aws_security_group.spoke20_ec2_nsg.id]
    source_dest_check           = false
    key_name                    = aws_key_pair.spoke_20_key_pair.key_name
    associate_public_ip_address = var.spoke20_vm_associate_public_ip_address
    user_data                   = file("ec2_bootstrap.sh")

    # root disk
    root_block_device {
        volume_size           = var.spoke20_vm_root_volume_size
        volume_type           = var.spoke20_vm_root_volume_type
        delete_on_termination = true
        encrypted             = true
    }

        tags = {
            Name = "UbntSpoke20-VM"
    }
}


# Create Elastic IP for the EC2 instance
resource "aws_eip" "spoke20_vm_eip" {
    vpc  = true
}

# Associate Elastic IP to the EC2 Instance
resource "aws_eip_association" "spoke20_vm_eip_association" {
    instance_id   = aws_instance.spoke20_vm01.id
    allocation_id = aws_eip.spoke20_vm_eip.id
}