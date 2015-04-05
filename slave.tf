module "s_amitype" {
    source = "github.com/bobtfish/terraform-amitype"
    instance_type = "${var.slave_instance_type}"
}

module "s_ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "${module.s_amitype.ami_type_prefer_hvm}"
  storagetype = "ebs"
}

resource "aws_instance" "mesos_slave" {
    iam_instance_profile = "${var.discovery_instance_profile}"
    allocate_public_ip_address = false
    count = "${var.slaves}"
    ami = "${module.s_ami.ami_id}"
    instance_type = "${var.slave_instance_type}"
    security_groups = [ "${aws_security_group.mesos_ssh.id}", "${aws_security_group.mesos_internal.id}" ]
    subnet_id = "${var.subnet_id}"
    key_name = "${var.admin_key_name}"
    tags {
      Name = "mesos-slave-${count.index+1}"
      role = "mesos-slave"
    }
    user_data = "${replace(file(\"${path.module}/slave.conf\"), \"__CLUSTER_SIZE__\", \"${var.masters}\")}"
}
