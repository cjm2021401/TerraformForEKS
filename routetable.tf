# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id
  tags   = { Name = "${local.vpc_name}-public" }
}

# Public subnet -> igw
resource "aws_route" "public_igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Connect public subnet to  route_table
resource "aws_route_table_association" "public" {
  count = length(local.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


# Route table for private subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id
  tags   = { Name = "${local.vpc_name}-private" }
}

# Private subnet -> NAT gateway
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Connection 
resource "aws_route_table_association" "private" {
  count = length(local.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
