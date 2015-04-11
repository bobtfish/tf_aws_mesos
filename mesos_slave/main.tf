module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami/ebs"
  region = "${var.region}"
  distribution = "trusty"
  instance_type = "${var.instance_type}"
}

resource "aws_instance" "mesos_slave" {
    associate_public_ip_address = false
    iam_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.count}"
    ami = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    security_groups = [ "${var.security_group_ssh}", "${var.security_group_internal}" ]
    subnet_id = "${element(split(\",\", var.subnet_ids), count.index)}"
    key_name = "${var.admin_key_name}"
    # FIXME - disk size here!
    tags {
      Name = "mesos-slave-${count.index+1}"
      role = "mesos-slave"
    }
    user_data = "${replace(file(\"${path.module}/slave.conf\"), \"__ZOOKEEPER_CLUSTER_SIZE__\", \"${var.zookeeper_cluster_size}\")}"
}
