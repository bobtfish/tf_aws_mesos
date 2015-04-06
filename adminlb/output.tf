output "public_ips" {
    value = "${join(\",\", aws_instance.adminlb.*.public_ip)}"
}
output "instance_ids" {
    value = "${join(\",\", aws_instance.adminlb.*.id)}"
}

