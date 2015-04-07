## credential stuff
variable "admin_key_name" {}
variable "region" {}
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
variable "load_balancer" {}
