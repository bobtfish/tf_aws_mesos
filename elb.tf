module "elb" {
    source = "elb/"
    subnet_ids = "${var.public_subnet_ids}"
    security_group_ids = "${aws_security_group.mesos_http_all.id}"
}

