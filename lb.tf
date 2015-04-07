
module "lb" {
    source = "lb"
    security_group_http = "${aws_security_group.mesos_http_all.id}"
    security_group_ssh = "${aws_security_group.mesos_ssh.id}"
    security_group_internal = "${aws_security_group.mesos_internal.id}"
    discovery_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.lbs}"
    instance_type = "${var.lb_instance_type}"
    admin_key_name = "${var.admin_key_name}"
    domain = "${var.domain}"
    region = "${var.region}"
}

