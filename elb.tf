module "elb" {
    source = "elb/"
    instance_ids = "${module.lb.instance_ids}"
    subnet_ids = "${var.public_subnet_ids}"
    security_group_ids = "${aws_security_group.mesos_http_all.id}"
}

