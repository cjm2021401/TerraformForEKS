# VPC
resource "aws_vpc" "eks_vpc" {
  cidr_block = local.cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = { Name = local.vpc_name }
}

# Default route table
# not used
resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.eks_vpc.default_route_table_id
  tags = { Name = "${local.vpc_name}-default"}
}

# Default security group
resource "aws_default_security_group" "default_security_group" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = { Name = "${local.vpc_name}-default"}
}
