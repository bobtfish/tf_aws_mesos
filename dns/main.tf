resource "aws_route53_zone" "mesos" {
   name = "${var.domain}"
}
/*
resource "aws_route53_record" "star" {
   zone_id = "${aws_route53_zone.mesos.zone_id}"
   name = "*.${var.domain}"
   type = "A"
   ttl = "300"
   records = ["${split(\",\", var.server_ips)}"]
}
*/
