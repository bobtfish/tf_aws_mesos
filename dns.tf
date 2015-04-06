module "dns" {
    source = "dns/"
    domain = "${var.domain}"
    elb_name = "${aws_elb.mesos.dns_name}"
}

