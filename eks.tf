# EKS cluster
module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = local.cluster_name
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = aws_vpc.eks_vpc.id
  subnet_ids = aws_subnet.private[*].id

  cloudwatch_log_group_retention_in_days = 1
#설치중 coredns수정 필요
  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "kube-system"
        },
        {
          namespace = "default"
        },
        {
          namespace = "mobility"
        }
      ]
    }
  }
}
