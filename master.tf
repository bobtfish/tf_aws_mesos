
module "mesos_master" {
    source = "mesos_master"
    security_group_http = "${aws_security_group.mesos_http.id}"
    security_group_ssh = "${aws_security_group.mesos_ssh.id}"
    security_group_internal = "${aws_security_group.mesos_internal.id}"
    discovery_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.masters}"
    instance_type = "${var.master_instance_type}"
    subnet_id = "${var.private_subnet_ids}"
    admin_key_name = "${var.admin_key_name}"
    domain = "${var.domain}"
    region = "${var.region}"
    vpc_id = "${var.vpc_id}"
    subnet_id = "${var.subnet_id}"
    ssh_private_key_file = "${var.ssh_private_key_file}"
}

