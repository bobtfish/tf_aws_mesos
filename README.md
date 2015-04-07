# Terraform AWS Mesos

## Module to set up a Mesos cluster on AWS using Terraform

## Example Use

Create a file `mesos.tf` containing something like this:

    module "mesos" {
        source                      = "github.com/bobtfish/tf_aws_mesos"
        slaves                      = "5"
        region = "${var.region}"
        admin_iprange = "${var.admin_iprange}"
        admin_key_name = "${aws_key_pair.admin.key_name}"
        private_subnet_ids = "${module.vpc.primary-az-ephemeralsubnet}"
        public_subnet_ids = "${module.vpc.primary-az-frontsubnet}"
        domain = "${var.domain}"
        vpc_id = "${module.vpc.id}"
        discovery_instance_profile = "describe-instances"
    }

See the `variables.tf` file for the available variables and their defaults

## Visit the web interfaces

When the cluster is set up, you need to [retrieve the NS server records for your _domain_ from route53, and add delegations
to this new subdomain from the domain you own (wherever that is managed):

![Route53 console](https://raw.githubusercontent.com/bobtfish/terraform-example-mesos-cluster/master/route53.png)

After which, you should be able to visit the admin interfaces at:

  * mesos.admin.yoursubdomain
  * marathon.admin.yoursubdomain

You can launch marathon apps using the API (or the web interface) as per [this guide](https://www.digitalocean.com/community/tutorials/how-to-configure-a-production-ready-mesosphere-cluster-on-ubuntu-14-04), and each app's PORT will be made available via HTTP at the name of the app. For example the marathon app named _/www_ becomes _www.yoursubdomain_

## To do

  * Currently no way to retrieve the address of the DNS servers for the Route53 zone through Terraform. Use the Console to retrieve the addresses. 
  * Cannot reach the log files of the Mesos slave nodes from the web interface
  * Whilst the cluster we build is redundant, currently all the machines are allocated in a single availability zone.
  * The machines have no configuration management (no puppet/chef), which means that making any changes to them (or getting any security updates) involves rebuilding the instances.

## Credits

This module is based on the code from ContainerSolutions, and their excellent GCE howto: <http://container-solutions.com/2015/04/how-to-set-up-mesos-on-google-cloud-with-terraform/>

  
