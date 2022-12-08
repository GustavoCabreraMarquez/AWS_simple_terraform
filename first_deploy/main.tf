resource "aws_instance" "web" {
  ami = "ami-026b57f3c383c2eec" 
  instance_type = "t3.medium"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids =  [aws_security_group.allow_ssh.id]

  tags = {
    Name = "first_terraform_instance"
  }


}

resource "aws_instance" "web2" {
  ami = "ami-026b57f3c383c2eec" 
  instance_type = "t3.medium"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids =  [aws_security_group.allow_ssh.id]

  tags = {
    Name = "second_terraform_instance"
  }


}

resource "aws_instance" "web3" {
  ami = "ami-026b57f3c383c2eec" 
  instance_type = "t3.medium"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids =  [aws_security_group.allow_ssh.id]

  tags = {
    Name = "third_terraform_instance"
  }


}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrW7/iHVuk2yyzOgMuyWRnK/buIkUt01XMf0j55LrIvKypp+9vU/QS5iPRIs1wEIY+dPnuLVCgqXoakP5zd5OcHcTqNHPsgtElDeWFYK0pEjY8uQ+t6MjHUgwKLWfQmPkdeyO8fH74UB0YMX5MsOBbUf6O7BhG7eSnWISD91X4Eehyar0BoBFU6Xf55b8OlpRGgP5ZyPvgg36qDHOgQuxa0U9XHojTkl+GNcP1Lbmv0/n8colUxlBjdbf5EbuiYqHNT+EsbRTc1j4GBSyT7kQ7V7xnKuZh0uUt1SxAurO6hPis6UmQ/AfC1IAGNUouDMgYOOIAbKOrcR/RkH19w2lVL6K1yUaIiII4pxOScTWZ1B3cx0jYuxzp+Qm2l4VfEbSf5FVG49vYZBlNVBkkIQ3xm1iVcCmlRBI5tzOpcDAWRMdoN4e1pmYy29LqIStMr4AjUSdBWLgn5LZhbqWZ1yyCdMBUwDZSGuLYJZSvT4RiesuajWQINTc8FB/aiY7m98U= guss@guss-desktop"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-073ead03b605c1680"

  ingress {
    description      = "SSH from world"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
      }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}