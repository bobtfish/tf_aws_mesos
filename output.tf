output "master_public_ip" {
  value = "${module.mesos_master.public_ip}"
}

