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

karpenter_capacity = [
  {
    name               = "dbasoft-capacity"
    workload           = "dbasoft-workload"
    ami_family         = "AL2023"
    ami_ssm            = "/aws/service/eks/optimized-ami/1.31/amazon-linux-2023/x86_64/standard/recommended/image_id"
    instance_family    = ["t3", "t3a", "c6", "c6a"]
    instance_sizes     = ["large", "xlarge", "2xlarge"]
    capacity_type      = ["spot", "on-demand"]
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  },
  {
    name               = "chip-capacity"
    workload           = "chip"
    ami_family         = "Bottlerocket"
    ami_ssm            = "/aws/service/bottlerocket/aws-k8s-1.31/x86_64/latest/image_id"
    instance_family    = ["t3", "t3a", "c6", "c6a"]
    instance_sizes     = ["large", "xlarge", "2xlarge"]
    capacity_type      = ["spot"]
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  },
  {
    name               = "critical-capacity"
    workload           = "critical"
    ami_family         = "Bottlerocket"
    ami_ssm            = "/aws/service/bottlerocket/aws-k8s-1.31/x86_64/latest/image_id"
    instance_family    = ["t3", "t3a", "c6", "c6a"]
    instance_sizes     = ["large", "xlarge"]
    capacity_type      = ["on-demand"]
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

]