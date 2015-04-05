## credential stuff
# path to the account file
variable "account_file" {}
# the username to connect with
variable "ssh_user" {}
# the private key of the user
variable "ssh_private_key_file" {}
variable "admin_key_name" {}
## google project stuff
# the google region where the cluster should be created
variable "region" {}
# the google zone where the cluster should be created
variable "zone" {}
# the name of the google project
variable "project" {}
# image to use for installation
variable "image" {
    default = "ubuntu-os-cloud/ubuntu-1404-trusty-v20150128"
}
variable "master_instance_type" {
    default = "m3.large"
}
variable "slave_instance_type" {
    default = "m3.medium"
}
variable "subnet_id" {}
# private address for unlimited access to the cluster, in CIDR
variable "localaddress" {}
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


