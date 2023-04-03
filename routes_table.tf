# create private route table
resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = format("%s-Private-Route-Table", var.name)
    },
  )
}


# associate all private subnets to the private route table
# resource "aws_route_table_association" "private-subnets-assoc" {
#   count          = length(aws_subnet.private[*].id)  # returns the length of all priate subnets
#   subnet_id      = element(aws_subnet.private[*].id, count.index) # the element function starts counting from 0 and attach each priate subnet at each iteration
#   route_table_id = aws_route_table.private-rtb.id
# }

# Create route for the private route table and attach a nat gateway to it
resource "aws_route" "private-rtb-route" {
  route_table_id         = aws_route_table.private-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat.id
}


resource "aws_route_table_association" "private-subnets-assoc" {
  for_each = toset(aws_subnet.private[*].id)
  subnet_id      = each.value
  route_table_id = aws_route_table.private-rtb.id
}


# create route table for the public subnets
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    {
      Name = format("%s-Public-Route-Table", var.name)
    },
  )
}
# create route for the public route table and attach the internet gateway
resource "aws_route" "public-rtb-route" {
  route_table_id         = aws_route_table.public-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

# associate all public subnets to the public route table
# resource "aws_route_table_association" "public-subnets-assoc" {
#   count          = length(aws_subnet.public[*].id)
#   subnet_id      = element(aws_subnet.public[*].id, count.index)
#   route_table_id = aws_route_table.public-rtb.id
# }

resource "aws_route_table_association" "public-subnets-assoc" {
  for_each = toset(aws_subnet.public[*].id)
  subnet_id      = each.value
  route_table_id = aws_route_table.public-rtb.id
}

