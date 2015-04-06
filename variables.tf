## credential stuff
variable "domain" {}
variable "admin_key_name" {}
variable "ssh_private_key_file" {}
variable "region" {}
variable "vpc_id" {}
variable "master_instance_type" {
    default = "m3.large"
}
variable "discovery_instance_profile" {}
variable "slave_instance_type" {
    default = "m3.medium"
}
variable "instance_subnet_id" {}
variable "elb_subnet_id" {}
# domain name used by haproxy
variable "domain" {}

## mesos stuff
# the name of the cluster
# number of master nodes to install
variable "masters" {
    default = "1"
}
# number of slaves to install
variable "slaves" {
    default = "3"
}


