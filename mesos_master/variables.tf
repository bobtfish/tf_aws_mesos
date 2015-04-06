## credential stuff
variable "admin_key_name" {}
variable "ssh_private_key_file" {}
variable "region" {}
variable "vpc_id" {}
variable "instance_type" {
    default = "m3.large"
}
variable "discovery_instance_profile" {}
variable "subnet_id" {}
# domain name used by nginx 
variable "domain" {}

## mesos stuff
# the name of the cluster
# number of master nodes to install
variable "count" {
    default = "3"
}
variable "security_group_http" {}
variable "security_group_ssh" {}
variable "security_group_internal" {}

