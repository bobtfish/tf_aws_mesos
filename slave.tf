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
    associate_public_ip_address = true
    iam_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.slaves}"
    ami = "${module.s_ami.ami_id}"
    instance_type = "${var.slave_instance_type}"
    security_groups = [ "${aws_security_group.mesos_http.id}", "${aws_security_group.mesos_https.id}", "${aws_security_group.mesos_ssh.id}", "${aws_security_group.mesos_internal.id}" ]
    subnet_id = "${var.subnet_id}"
    key_name = "${var.admin_key_name}"
    tags {
      Name = "mesos-slave-${count.index}"
      role = "mesos-slave"
    }

    # define default connection for remote provisioners
    connection {
      user = "ubuntu"
      key_file = "${var.ssh_private_key_file}"
    }

    user_data = "${file(\"${path.module}/slave.conf\")}"

    # install mesos, haproxy and docker
    provisioner "remote-exec" {
      scripts = [
        "${path.module}/scripts/wait_for_cloudinit.sh",
        "${path.module}/scripts/haproxy_marathon_bridge_install.sh",
        "${path.module}/scripts/common_config.sh",
        "${path.module}/scripts/slave_config.sh"
      ]
    }
}
