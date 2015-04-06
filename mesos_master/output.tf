output "public_ip" {
    value = "${aws_instance.mesos_master.public_ip}"
}
