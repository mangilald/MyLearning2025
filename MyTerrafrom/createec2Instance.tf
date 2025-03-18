# Create a new instance of the latest Redhat on an
# t2.micro node with an AWS Tag naming it "SAP Test1"

resource "aws_instance" "SAPASCS" {
  ami           = "ami-0468ac5f57c53fbad"
  instance_type = "t2.small"
  key_name      = "sapslesami"
  tags = {
    Name = "SAPASCS"
  }
}

resource "aws_security_group" "saptestsecgroup" {
  name        = "security group for testing SAP with terraform"
  description = "security group for testing SAP with terraform"
  vpc_id      = "vpc-0f2459c1542f856fd"
  

  ingress {
    description = "HTTPD"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     =  ["0.0.0.0/0"]
    ipv6_cidr_blocks = [::/0]
  }
  ingress {
    description = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     =  ["0.0.0.0/0"]
    ipv6_cidr_blocks = [::/0]
  }
  ingress {
    description = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     =  ["0.0.0.0/0"]
    ipv6_cidr_blocks = [::/0]
  }
  egress {
    description = "SSH"
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     =  ["0.0.0.0/0"]
    ipv6_cidr_blocks = [::/0]
  }

  tags = {
    Name = "SAP_TEST_SG"
  }
}