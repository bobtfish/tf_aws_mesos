resource "aws_instance" "mesos_master" {
    count = "${var.masters}"
    ami = "ami-1234"
    instance_type = "${var.master_instance_type}"
    security_groups = [ "${aws_security_group.mesos_http.id}", "${aws_security_group.mesos_https.id}", "${aws_security_group.mesos_ssh.id}", "${aws_security_group.mesos_vpn.id}", "${aws_security_group.mesos_internal.id}" ]
    subnet_id = "${var.subnet_id}"
    tags {
      Name = "mesos-master-${count.index}"
    }
    
    # define default connection for remote provisioners
    connection {
      user = "${var.ssh_user}"
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

