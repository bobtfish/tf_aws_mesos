## credential stuff
variable "admin_key_name" {}
variable "ssh_private_key_file" {}
variable "region" {}
variable "vpc_id" {}
variable "instance_type" {
    default = "m3.large"
}
variable "discovery_instance_profile" {}
variable "subnet_ids" {}
variable "domain" {}
variable "count" {
    default = "2"
}
variable "security_group_http" {}
variable "security_group_ssh" {}
variable "security_group_internal" {}

