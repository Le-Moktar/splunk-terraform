#Nat Gateway
resource "aws_eip" "splunk-eip" {
  
}
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.splunk-eip.id
  subnet_id = aws_subnet.public1.id
  tags = {
    Name = "splunk-nat-gtw"
  }
}
