resource "aws_instance" "splunk-server" {
  ami               = "ami-0ca9fb66e076a6e32"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = aws_key_pair.aws_key.key_name
  subnet_id         = aws_subnet.public1.id
  security_groups   = [aws_security_group.splunk-sg.id]
#   vpc_security_group_ids = [ aws_security_group.sg-demo.id ]
  user_data         = file("splunk-data.sh")
  tags = {
    Name      = "splunk-server"
    Team      = "Cloud Transformation"
    Create_by = "moktar"
  }
}

resource "aws_ebs_volume" "splunk-ebs" {
  availability_zone = "us-east-1a"
  size              = 25
  tags = {
    Name = "splunk-ebs"
  }
}


# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "splunk-ebs" {
  device_name = "/dev/sdh"  # Device name on the EC2 instance
  volume_id   = aws_ebs_volume.splunk-ebs.id
  instance_id = aws_instance.splunk-server.id
}
