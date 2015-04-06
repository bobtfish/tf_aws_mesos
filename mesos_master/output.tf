output "public_ips" {
    value = "${join(\",\", aws_instance.mesos_master.*.public_ip)}"
}
