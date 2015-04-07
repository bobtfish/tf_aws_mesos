module "amitype" {
    source = "github.com/bobtfish/terraform-amitype"
    instance_type = "${var.instance_type}"
}

module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "trusty"
  architecture = "amd64"
  virttype = "${module.amitype.ami_type_prefer_hvm}"
  storagetype = "ebs"
}

resource "aws_autoscaling_group" "mesos_lb" {
  name = "mesos_lb-${var.domain}"
  availability_zones = ["${var.availability_zones}"]
  vpc_zone_identifier = [ "${var.subnet_ids}" ]
  max_size = "${toint(var.count)+1}" 
  min_size = "${var.count}"
  health_check_grace_period = 300
  health_check_type = "EC2"
  desired_capacity = "${var.count}"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.lb.name}"
  load_balancers = [ "${var.load_balancer}" ]
  tag {
    key = "role"
    value = "lb"
    propagate_at_launch = true
  }
  tag {
    key = "Name"
    value = "lb"
    propagate_at_launch = true
  }
}
resource "aws_launch_configuration" "lb" {
    image_id = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    user_data = "${replace(replace(file(\"${path.module}/lb.conf\"), \"__CLUSTER_SIZE__\", \"${var.count}\"), \"__DOMAIN__\", \"${var.domain}\")}"
    security_groups = [ "${var.security_group_http}", "${var.security_group_ssh}", "${var.security_group_internal}" ]
    subnet_id = "${var.subnet_ids}"
    key_name = "${var.admin_key_name}"
    associate_public_ip_address = false
    iam_instance_profile = "${var.discovery_instance_profile}"
    lifecycle {
        create_before_destroy = true
    }
}

