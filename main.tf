module "transit150" {
    source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
    #version = "2.4.1" # v.7.x
    version = "v2.2.1" # v.6.8

    cloud           = var.cloud_type
    region          = var.aws_us_region
    account         = var.aws_ctrl_account_name
    cidr            = var.transit150_cidr
    name            = var.transit150_vpc_name
    gw_name         = var.transit150_gw_name
    instance_size   = var.transit150_instance_type
    local_as_number = var.transit150_local_as_number
    insane_mode     = true
    az1             = "a"
    az2             = "c"
    ha_gw           = true
}

module "spoke_10" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    #version = "1.5.0" # v.7.x
    version = "v1.3.2" # v.6.8

    cloud           = var.cloud_type
    region          = var.aws_us_region
    account         = var.aws_ctrl_account_name
    cidr            = var.spoke10_cidr
    name            = var.spoke10_vpc_name
    gw_name         = var.spoke10_gw_name
    instance_size   = var.spoke10_instance_size
    local_as_number = var.spoke10_local_as_number
    transit_gw      = var.transit150_gw_name
    enable_bgp      = true

    depends_on      = [module.transit150]
}

module "spoke_20" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    #version = "1.5.0"  # v.7.x
    version = "v1.3.2" # v.6.8

    cloud           = var.cloud_type
    region          = var.aws_us_region
    account         = var.aws_ctrl_account_name
    cidr            = var.spoke20_cidr
    name            = var.spoke20_vpc_name
    gw_name         = var.spoke20_gw_name
    instance_size   = var.spoke20_instance_size
    local_as_number = var.spoke20_local_as_number
    transit_gw      = var.transit150_gw_name
    enable_bgp      = true

    depends_on      = [module.transit150]
}


resource "aws_vpn_gateway" "transit_vpn_gw" {
    vpc_id          = module.transit150.vpc.vpc_id
    amazon_side_asn = var.transit150_local_as_number

    depends_on      = [module.transit150]
}
