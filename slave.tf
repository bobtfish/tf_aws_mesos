resource "aws_instance" "mesos_slave" {
    count = "${var.slaves}"
    ami = "ami-1234"
    instance_type = "${var.slave_instance_type}"
    security_groups = [ "${aws_security_group.mesos_http.id}", "${aws_security_group.mesos_https.id}", "${aws_security_group.mesos_ssh.id}", "${aws_security_group.mesos_internal.id}" ]
    subnet_id = "${var.subnet_id}"
    key_name = "${var.admin_key_name}"
    tags {
      Name = "mesos-slave-${count.index}"
    }

    # define default connection for remote provisioners
    connection {
      user = "${var.ssh_user}"
      key_file = "${var.ssh_private_key_file}"
    }

    # install mesos, haproxy and docker
    provisioner "remote-exec" {
      scripts = [
        "${path.module}/scripts/slave_install.sh",
        "${path.module}/scripts/docker_install.sh",
        "${path.module}/scripts/haproxy_marathon_bridge_install.sh",
        "${path.module}/scripts/common_config.sh",
        "${path.module}/scripts/slave_config.sh"
      ]
    }
}
