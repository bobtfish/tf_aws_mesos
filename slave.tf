module "mesos_slave" {
    source = "mesos_slave"
    discovery_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.slaves}"
    instance_type = "${var.slave_instance_type}"
    security_group_ssh = "${aws_security_group.mesos_ssh.id}"
    security_group_internal = "${aws_security_group.mesos_internal.id}"
    subnet_id = "${var.subnet_id}"
    admin_key_name = "${var.admin_key_name}"
    zookeeper_cluster_size = "${var.masters}"
}
