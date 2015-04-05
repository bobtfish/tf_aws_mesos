output "address" {
  value = "${aws_instance.mesos_master.0.private_ip}"
}

