module "dns" {
    source = "dns/"
    domain = "${var.domain}"
    server_ips = "${module.mesos_master.public_ips}"
}

