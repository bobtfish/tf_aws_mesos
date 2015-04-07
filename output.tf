output "mesos_elb_dns_name" {
  value = "${module.elb.dns_name}"
}
output "mesos_elb_id" {
  value = "${module.elb.id}"
}
output "marathon_api" {
  value = "http://marathon.admin.${var.domain}"
}
output "mesos_api" {
  value = "http://mesos.admin.${var.domain}"
}
output "domain" {
  value = "${var.domain}"
}

