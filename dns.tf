module "dns" {
    source = "dns/"
    domain = "${var.domain}"
    elb_name = "${module.elb.dns_name}"
    adminlb_public_ips = "${module.adminlb.public_ips}"
}

