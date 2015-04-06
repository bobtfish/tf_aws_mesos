module "amitype" {
    source = "github.com/bobtfish/terraform-amitype"
    instance_type = "${var.instance_type}"
}

module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "${module.amitype.ami_type_prefer_hvm}"
  storagetype = "ebs"
}

resource "aws_instance" "mesos_master" {
    associate_public_ip_address = true
    iam_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.count}"
    ami = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    security_groups = [ "${var.security_group_http}", "${var.security_group_https}", "${var.security_group_ssh}" "${var.security_group_internal}" ]
    subnet_id = "${var.subnet_id}"
    key_name = "${var.admin_key_name}"
    tags {
      Name = "mesos-master-${count.index+1}"
      role = "mesos-master"
    }
    user_data = "${replace(replace(file(\"${path.module}/master.conf\"), \"__CLUSTER_SIZE__\", \"${var.count}\"), \"__DOMAIN__\", \"${var.domain}\")}"
}

