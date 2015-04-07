resource "aws_elb" "mesos" {
  name = "mesos-elb"
  internal = false
  subnets = [ "${split(\",\", var.subnet_ids)}" ]
  security_groups = [ "${split(\",\", var.security_group_ids)}" ]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/status"
    interval = 30
  }

  cross_zone_load_balancing = true
}

output "id" {
    value = "${aws_elb.mesos.id}"
}
output "name" {
    value = "${aws_elb.mesos.name}"
}
output "dns_name" {
    value = "${aws_elb.mesos.dns_name}"
}

output "id" {
  value = "${aws_elb.mesos.id}"
}

