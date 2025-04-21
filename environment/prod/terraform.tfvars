project_name = "dbasoft-cluster"
region       = "us-east-1"

k8s_version = "1.31"

auto_scale_options = {
  min     = 2
  max     = 10
  desired = 2
}

nodes_instance_sizes = [
  "t3.large",
  "t3a.large"
]

ssm_vpc = "/dbasoft-eks-vpc/vpc/id"

ssm_public_subnets = [
  "/dbasoft-eks-vpc/subnets/public/us-east-1a/subnet-public-1a",
  "/dbasoft-eks-vpc/subnets/public/us-east-1b/subnet-public-1b",
  "/dbasoft-eks-vpc/subnets/public/us-east-1c/subnet-public-1c",
]

ssm_private_subnets = [
  "/dbasoft-eks-vpc/subnets/private/us-east-1a/subnet-private-1a",
  "/dbasoft-eks-vpc/subnets/private/us-east-1b/subnet-private-1b",
  "/dbasoft-eks-vpc/subnets/private/us-east-1c/subnet-private-1c",
]

ssm_pod_subnets = [
  "/dbasoft-eks-vpc/subnets/private/us-east-1a/subnet-pods-1a",
  "/dbasoft-eks-vpc/subnets/private/us-east-1b/subnet-pods-1b",
  "/dbasoft-eks-vpc/subnets/private/us-east-1c/subnet-pods-1c",
]

