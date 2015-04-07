output "master_public_ips" {
  value = "${module.mesos_master.public_ips}"
}
output "marathon_api" {
  value = "http://marathon.admin.${var.domain}"
}
output "mesos_api" {
  value = "http://mesos.admin.${var.domain}"
}

