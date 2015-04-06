output "public_ip" {
    value = "${aws_instance.mesos_master.0.public_ip}"
}
