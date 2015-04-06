output "public_ips" {
    value = "${join(\",\", aws_instance.mesos_master.*.public_ip)}"
}
output "instance_ids" {
    value = "${join(\",\", aws_instance.mesos_master.*.id)}"
}

