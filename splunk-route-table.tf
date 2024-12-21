resource "aws_route_table" "splunk-pub-rt" {
  vpc_id = aws_vpc.splunk-vpc.id
  tags = {
    Name = "splunk-public-route-table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw1.id
  }
}

resource "aws_route_table" "splunk-pri-rt" {
  vpc_id = aws_vpc.splunk-vpc.id
  tags = {
    Name = "splunk-private-route-table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }
}
