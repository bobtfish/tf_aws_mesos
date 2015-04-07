## credential stuff
variable "admin_key_name" {}
variable "region" {}
variable "vpc_id" {}
variable "instance_type" {
    default = "t2.micro"
}
variable "discovery_instance_profile" {}
variable "subnet_id" {}
# domain name used by nginx 
variable "domain" {}

variable "count" {
    default = "1"
}
variable "security_group_http" {}
variable "security_group_ssh" {}
variable "security_group_internal" {}

