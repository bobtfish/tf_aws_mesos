
module "lb" {
    source = "lb"
    security_group_http = "${aws_security_group.mesos_http.id}"
    security_group_ssh = "${aws_security_group.mesos_ssh.id}"
    security_group_internal = "${aws_security_group.mesos_internal.id}"
    discovery_instance_profile = "${var.discovery_instance_profile}"
    count = "${var.lbs}"
    instance_type = "${var.lb_instance_type}"
    subnet_ids = "${var.private_subnet_ids}"
    admin_key_name = "${var.admin_key_name}"
    domain = "${var.domain}"
    region = "${var.region}"
    vpc_id = "${var.vpc_id}"
    ssh_private_key_file = "${var.ssh_private_key_file}"
}

