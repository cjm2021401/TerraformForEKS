locals {
  vpc_name        = "eks-vpc"
  cidr            = "10.194.0.0/16"
  public_subnets  = ["10.194.0.0/24", "10.194.1.0/24"]
  private_subnets = ["10.194.100.0/24", "10.194.101.0/24"]
  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  cluster_name    = "eks-cluster"
  lb_controller_iam_role_name        = "inhouse-eks-aws-lb-ctrl"
  lb_controller_service_account_name = "aws-load-balancer-controller"
}