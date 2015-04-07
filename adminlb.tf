
module "adminlb" {
    source = "adminlb"
    security_group_http = "${aws_security_group.mesos_http_admin.id}"
    security_group_ssh = "${aws_security_group.mesos_ssh.id}"
    security_group_internal = "${aws_security_group.mesos_internal.id}"
    discovery_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.adminlbs}"
    instance_type = "${var.adminlb_instance_type}"
    subnet_id = "${var.public_subnet_ids}"
    admin_key_name = "${var.admin_key_name}"
    domain = "${var.domain}"
    region = "${var.region}"
}

