## credential stuff
variable "domain" {}
variable "admin_key_name" {}
variable "region" {}
variable "vpc_id" {}
variable "admin_iprange" {}
variable "vpc_iprange" {
  default = "0.0.0.0/0"
}
variable "adminlb_instance_type" {
    default = "t2.micro"
}
variable "lb_instance_type" {
    default = "t2.micro"
}
variable "master_instance_type" {
    default = "t2.micro"
}
variable "discovery_instance_profile" {}
variable "slave_instance_type" {
    default = "t2.micro"
}
variable "private_subnet_ids" {}
variable "public_subnet_ids" {}
variable "domain" {}
variable "adminlbs" {
    default = "1"
}
variable "lbs" {
    default = "2"
}
variable "masters" {
    default = "3"
}
# number of slaves to install
variable "slaves" {
    default = "3"
}


