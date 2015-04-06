# Create a new load balancer
resource "aws_elb" "mesos" {
  name = "mesos-elb"
  availability_zones = ["eu-central-1a", "eu-central-1-b"]

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
    target = "HTTP:80/"
    interval = 30
  }

  instances = ["${split(\",\", module.mesos_master.instance_ids)}"]
  cross_zone_load_balancing = true
}

output "dns_name" {
  value = "${aws_elb.mesos.dns_name}"
}

output "id" {
  value = "${aws_elb.mesos.id}"
}

