
variable "aws_region" {
  description = "Provide the region to deploy the VPC in"

}
variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"

}
variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
}
variable subnet_bits {
  description = "Number of bits in the network portion of the subnet CIDR"
}
variable "public_subnet_index" {
  description = "Index of the public subnet"
}
variable "private_subnet_index" {
  description = "Index of the private subnet"
}
variable "tgw_subnet_index" {
  description = "Index of the tgw subnet"
}
variable "keypair" {
  description = "Keypair for instances that support keypairs"
}
variable "cp" {
  description = "Customer Prefix to apply to all resources"
}
variable "env" {
  description = "The Tag Environment to differentiate prod/test/dev"
}
variable "vpc_name_security" {
    description = "Name of Security VPC"
}
variable "vpc_name_east" {
    description = "Name of east VPC"
}
variable "vpc_name_west" {
    description = "Name of west VPC"
}
variable "vpc_cidr_security" {
    description = "CIDR for the whole security VPC"
}
variable "vpc_cidr_east" {
    description = "CIDR for the whole east VPC"
}
variable "vpc_cidr_west" {
    description = "CIDR for the whole west VPC"
}
variable "fgt_admin_password" {
  description = "Fortigate Admin Password"
}
variable "fortios_version" {
  description = "FortiOS Version for the AMI Search String"
}
variable "fgt_byol_1_license" {
  description = "Fortigate license file"
}
variable "fgt_byol_2_license" {
  description = "Fortigate license file"
}
variable "fgt_host_ip" {
  description = "Host IP for each interface of the Fortigate"
}
variable "enable_linux_instances" {
  description = "Boolean to allow creation of Linux Instances in East/West VPCs"
  type        = bool
}
variable "enable_cross_az_lb" {
  description = "Boolean to allow cross AZ load balancing on Gateway Load Balancer"
  type        = bool
}
variable "elb_listener_port" {
  description = "Health check port for Gateway Load Balancer"
}
variable "create_public_elastic_ip" {
  description = "Boolean Create the failover elastic ip in the public subnet."
  type = bool
}
variable "enable_fortimanager" {
  description = "Boolean to allow creation of Fortimanager Instance in Security VPC"
  type        = bool
}
variable "use_fortimanager_byol" {
  description = "Boolean Use the Fortimanager BYOL AMI"
  type = bool
}
variable "fortimanager_enable_public_ips" {
  description = "Boolean to allocatee a public IP (EIP) for Fortimanager"
  type = bool
}
variable "fortimanager_use_byol" {
  description = "Boolean to use Fortimanager license, ami, and configuration template"
  type = bool
}
variable "fortimanager_sg_name" {
  description = "Fortimanager Security Group Name"
}
variable "fortimanager_instance_type" {
  description = "Instance type for fortimanager"
}
variable "fortimanager_instance_name" {
  description = "Instance Name for fortimanager"
}
variable "fortimanager_os_version" {
  description = "Fortimanager OS Version for the AMI Search String"
}
variable "fortimanager_host_ip" {
  description = "Fortimanager IP Address"
}
variable "fortimanager_byol_license" {
  description = "Fortimanager byol license"
}
variable "create_vpc" {
  description = "Boolean Create the vpc in this deployment. "
  type = bool
}
variable "vpc_tag_name" {
    description = "Random Tag Name to place on VPC for data ID"
}
variable "vpc_tag_value" {
    description = "Random Tag Value to place on VPC for data ID"
}
variable "create_transit_gateway" {
  description = "Boolean Create the transit gateway in this deployment. If TGW isn't created, neither will connected objects"
  type = bool
}
variable "use_fortigate_byol" {
  description = "Boolean Use the Fortigate BYOL AMI"
  type = bool
}
variable "public1_description" {
    description = "Description Public 1 Subnet TAG"
}
variable "private1_description" {
    description = "Description Private 1 TO Subnet TAG"
}
variable "tgw1_description" {
    description = "Description TGW 1 TO Subnet TAG"
}
variable "public2_description" {
    description = "Description Public 2 Subnet TAG"
}
variable "private2_description" {
    description = "Description Private 2 Subnet TAG"
}
variable "tgw2_description" {
    description = "Description TGW 2 Subnet TAG"
}
variable "cidr_for_access" {
  description = "CIDR to use for security group access"
}
variable "fortigate_instance_type" {
  description = "Instance type for fortigates"
}
variable "fortigate_instance_name_1" {
  description = "Instance Name for fortigate"
}
variable "fortigate_instance_name_2" {
  description = "Instance Name for fortigate"
}
variable "acl" {
  description = "The S3 acl"
}
variable "fortigate_hostname_1" {
  description = "Fortigate Hostname 1"
}
variable "fortigate_hostname_2" {
  description = "Fortigate Hostname 2"
}
variable "fgt_sg_name" {
  description = "Fortigate Security Group Name"
}
variable "ec2_sg_name" {
  description = "Linux Endpoint Security Group Name"
}
variable "linux_instance_name_east" {
  description = "Linux Endpoint Instance Name"
}
variable "linux_instance_name_west" {
  description = "Linux Endpoint Instance Name"
}
variable "linux_instance_type" {
  description = "Linux Endpoint Instance Type"
}
variable "linux_host_ip" {
  description = "Host IP for Linux Instances"
}