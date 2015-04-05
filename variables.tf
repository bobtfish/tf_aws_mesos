## credential stuff
variable "admin_key_name" {}
variable "aws_key_location" {
}
variable "region" {}
variable "vpc_id" {}
variable "master_instance_type" {
    default = "m3.large"
}
variable "slave_instance_type" {
    default = "m3.medium"
}
variable "subnet_id" {}
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


