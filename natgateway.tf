# EIP for NAT gateway(1)  
resource "aws_eip" "nat_gateway_1" {
  vpc  = true
  tags = { Name = "${local.vpc_name}-natgw-1" }
}

# EIP for NAT gateway(2)  
resource "aws_eip" "nat_gateway_2" {
  vpc  = true
  tags = { Name = "${local.vpc_name}-natgw-2" }
}