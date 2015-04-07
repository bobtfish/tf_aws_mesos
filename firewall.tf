resource "aws_security_group" "mesos_internal" {
  name = "mesos-${var.domain}-internal_allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 0
      to_port = 65535
      protocol = "-1"
      self        = true
  }

  tags {
    Name = "mesos-${var.domain}-internal_allow_all"
  }
}

resource "aws_security_group" "mesos_http_all" {
  name = "mesos-${var.domain}-http_all"
  description = "Allow all inbound HTTP traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos-${var.domain}-http_all"
  }
}

resource "aws_security_group" "mesos_http_admin" {
  name = "mesos-${var.domain}-http_admin"
  description = "Allow inbound HTTP traffic from admin IP range"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${var.admin_iprange}"]
  }

  tags {
    Name = "mesos-${var.domain}-http_admin"
  }
}


resource "aws_security_group" "mesos_ssh" {
  name = "mesos-${var.domain}-ssh"
  description = "Allow all inbound SSH traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.admin_iprange}", "${var.vpc_iprange}"]
  }

  tags {
    Name = "mesos-${var.domain}-ssh"
  }
}

