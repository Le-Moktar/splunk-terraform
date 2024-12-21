#route and public1 subnet association
resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.splunk-pub-rt.id
}

#route and public2 subnet association
resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.splunk-pub-rt.id
}


#route and private1 subnet association
resource "aws_route_table_association" "rta3" {
  subnet_id = aws_subnet.private1.id
  route_table_id = aws_route_table.splunk-pri-rt.id
}

#route and private2 subnet association
resource "aws_route_table_association" "rta4" {
  subnet_id = aws_subnet.private2.id
  route_table_id = aws_route_table.splunk-pri-rt.id
}

