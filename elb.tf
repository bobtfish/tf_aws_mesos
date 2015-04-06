module "elb" {
    source = "elb/"
    instance_ids = "${module.mesos_master.instance_ids}"
}

output "mesos_elb_dns_name" {
  value = "${module.elb.dns_name}"
}

output "mesos_elb_id" {
  value = "${module.elb.id}"
}

