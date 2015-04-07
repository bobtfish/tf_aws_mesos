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

resource "aws_autoscaling_group" "mesos_slave" {
  name = "mesos_slave-${var.domain}"
  availability_zones = ["${var.availability_zones}"]
  vpc_zone_identifier = [ "${var.subnet_ids}" ]
  max_size = "${toint(var.count)+1}" 
  min_size = "${var.count}"
  health_check_grace_period = 300
  health_check_type = "EC2"
  desired_capacity = "${var.count}"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.mesos_slave.name}"

  tag {
    key = "role"
    value = "mesos-slave"
    propagate_at_launch = true
  }
  tag {
    key = "Name"
    value = "mesos-slave"
    propagate_at_launch = true
  }
}
resource "aws_launch_configuration" "mesos_slave" {
    image_id = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    user_data = "${replace(file(\"${path.module}/slave.conf\"), \"__ZOOKEEPER_CLUSTER_SIZE__\", \"${var.zookeeper_cluster_size}\")}"
    security_groups = [ "${var.security_group_ssh}", "${var.security_group_internal}" ]
    subnet_id = "${var.subnet_ids}"
    key_name = "${var.admin_key_name}"
    associate_public_ip_address = false
    iam_instance_profile = "${var.discovery_instance_profile}"
    root_block_device {
        volume_type = "${var.volume_type}"
        volume_size = "${var.volume_size}"
    }
    lifecycle {
        create_before_destroy = true
    }
}

