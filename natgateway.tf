# EIP for NAT gateway
resource "aws_eip" "eip" {
  vpc  = true
  tags = { Name = "${local.vpc_name}-natgw" }
}

# NAT gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id 
  tags          = { Name = "${local.vpc_name}-natgw" }
}