resource "aws_security_group" "mesos_internal" {
  name = "mesos_internal_allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 0
      to_port = 65535
      protocol = "-1"
#      security_groups = [ "${self.id}" ]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "-1"
#      security_groups = [ "${self.id}" ]
  }

  tags {
    Name = "mesos_internal_allow_all"
  }
}

resource "aws_security_group" "mesos_http" {
  name = "mesos_http"
  description = "Allow all inbound HTTP traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos_http"
  }
}

resource "aws_security_group" "mesos_https" {
  name = "mesos_https"
  description = "Allow all inbound HTTPS traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos_https"
  }
}

resource "aws_security_group" "mesos_ssh" {
  name = "mesos_ssh"
  description = "Allow all inbound SSH traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos_ssh"
  }
}

resource "aws_security_group" "vpn" {
  name = "vpn"
  description = "Allow all inbound VPN traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 1194
      to_port = 1194
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "vpn"
  }
}

