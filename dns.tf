module "dns" {
    source = "dns/"
    domain = "${var.domain}"
    elb_name = "${module.elb.dns_name}"
}

