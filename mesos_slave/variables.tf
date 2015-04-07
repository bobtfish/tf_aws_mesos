## credential stuff
variable "security_group_internal" {}
variable "security_group_ssh" {}
variable "zookeeper_cluster_size" {}
variable "admin_key_name" {}
variable "region" {}
variable "discovery_instance_profile" {}
variable "instance_type" {
    default = "m3.medium"
}
variable "domain" {}
variable "subnet_ids" {}
variable "availability_zones" {}
# number of slaves to install
variable "count" {
    default = "3"
}
variable "zookeeper_cluster_size" {}
variable "volume_type" {
    default = "gp2"
}
variable "volume_size" {
    default = "32"
}

