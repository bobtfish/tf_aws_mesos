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

resource "aws_route53_record" "mesos" {
    zone_id = "${aws_route53_zone.mesos.zone_id}"
    name = "mesos.admin.${var.domain}"
    type = "A"
    ttl = "300"
    records = ["${split(\",\", var.adminlb_public_ips)}"]
}

resource "aws_route53_record" "mesos" {
    zone_id = "${aws_route53_zone.mesos.zone_id}"
    name = "marathon.admin.${var.domain}"
    type = "A"
    ttl = "300"
    records = ["${split(\",\", var.adminlb_public_ips)}"]
}

