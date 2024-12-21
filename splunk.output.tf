output "vpc" {
  value = aws_vpc.splunk-vpc.id
}

output "sg" {
  value = aws_security_group.splunk-sg.id
}

output "ec2-public-ip" {
  value = aws_instance.splunk-server.public_ip
}