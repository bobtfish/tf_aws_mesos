## credential stuff
variable "admin_key_name" {}
variable "region" {}
variable "instance_type" {
    default = "m3.large"
}
variable "discovery_instance_profile" {}
variable "subnet_ids" {}

## mesos stuff
# the name of the cluster
# number of master nodes to install
variable "count" {
    default = "3"
}
variable "security_group_ssh" {}
variable "security_group_internal" {}
variable "volume_type" {
    default = "gp2"
}
variable "volume_size" {
    default = "32"
}

