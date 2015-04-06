## credential stuff
variable "security_group_internal" {}
variable "security_group_ssh" {}
variable "zookeeper_cluster_size" {}
variable "admin_key_name" {}
variable "ssh_private_key_file" {}
variable "region" {}
variable "vpc_id" {}
variable "discovery_instance_profile" {}
variable "instance_type" {
    default = "m3.medium"
}
variable "subnet_id" {}

# number of slaves to install
variable "count" {
    default = "3"
}
variable "zookeeper_cluster_size" {}

