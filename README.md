# Terraform AWS Mesos

## Module to set up a Mesos cluster on AWS using Terraform

## Example Use

Create a file `mesos.tf` containing something like this:


    module "mesos" {
        source                      = "github.com/ContainerSolutions/terraform-mesos"
        account_file                = "/path/to/your.key.json"
        project                     = "your google project"
        region                      = "europe-west1"
        zone                        = "europe-west1-d"
        gce_ssh_user                = "user"
        name                        = "mymesoscluster"
        masters                     = "3"
        slaves                      = "5"
        network                     = "10.20.30.0/24"
        localaddress                = "92.111.228.8/32"
        domain                      = "example.com"
    }

See the `variables.tf` file for the available variables and their defaults

## Visit the web interfaces
When the cluster is set up, check the Google Developers Console for the addresses of the master nodes (or scroll back in the output of the apply step to retrieve them).
- Go to <http://ipaddress:5050> for the Mesos Console 
- and <http://ipaddress:8080> for the Marathon Console


## To do

- How do I call a script from a module?
- Currently no way to retrieve the ip address of the master nodes through Terraform. Use the Google Developers Console to retrieve the ip addresses. 
- Cannot reach the log files of the Mesos slave nodes from the web interface on the leading master
- VPN configuration


The installation and configuration used in this module is based on the code from ContainerSolutions, and their excellent howto: <http://container-solutions.com/2015/04/how-to-set-up-mesos-on-google-cloud-with-terraform/>
The installation and configuration used in this module is based on this excellent howto: <https://www.digitalocean.com/community/tutorials/how-to-configure-a-production-ready-mesosphere-cluster-on-ubuntu-14-04>

  
