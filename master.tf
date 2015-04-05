module "m_amitype" {
    source = "github.com/bobtfish/terraform-amitype"
    instance_type = "${var.master_instance_type}"
}

module "m_ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "${module.m_amitype.ami_type_prefer_hvm}"
  storagetype = "ebs"
}

resource "aws_instance" "mesos_master" {
    associate_public_ip_address = true
    count = "${var.masters}"
    ami = "${module.m_ami.ami_id}"
    instance_type = "${var.master_instance_type}"
    security_groups = [ "${aws_security_group.mesos_http.id}", "${aws_security_group.mesos_https.id}", "${aws_security_group.mesos_ssh.id}", "${aws_security_group.vpn.id}", "${aws_security_group.mesos_internal.id}" ]
    subnet_id = "${var.subnet_id}"
    key_name = "${var.admin_key_name}"
    tags {
      Name = "mesos-master-${count.index}"
    }
    
    # define default connection for remote provisioners
    connection {
      user = "ubuntu"
      key_file = "${var.ssh_private_key_file}"
    }
    
    # install mesos, haproxy, docker, openvpn, and configure the node
    provisioner "remote-exec" {
      scripts = [
        "${path.module}/scripts/master_install.sh",
        "${path.module}/scripts/docker_install.sh",
        "${path.module}/scripts/openvpn_install.sh",
        "${path.module}/scripts/haproxy_marathon_bridge_install.sh",
        "${path.module}/scripts/common_config.sh",
        "${path.module}/scripts/master_config.sh"
      ]
    }
}

