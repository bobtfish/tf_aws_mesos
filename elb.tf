module "elb" {
    source = "elb/"
    instance_ids = "${module.mesos_master.instance_ids}"
    subnet_ids = "${var.public_subnet_ids}"
    security_group_ids = "${aws_security_group.mesos_http.id}"
}

output "mesos_elb_dns_name" {
  value = "${module.elb.dns_name}"
}

output "mesos_elb_id" {
  value = "${module.elb.id}"
}

