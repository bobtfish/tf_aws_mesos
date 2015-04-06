resource "aws_route53_zone" "mesos" {
   name = "${var.domain}"
}

resource "aws_route53_record" "star" {
   zone_id = "${aws_route53_zone.mesos.zone_id}"
   name = "*.${var.domain}"
   type = "CNAME"
   ttl = "300"
   records = ["${var.elb_name}"]
}

