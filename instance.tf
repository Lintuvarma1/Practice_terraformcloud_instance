data "aws_vpc" "demo" {
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
}

data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.demo.id]
  }

}

resource "aws_security_group" "example" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.demo.id

  #instance_type = var.instance_type
  # key_name      = var.key_name
  # availability_zone = element(var.availability_zone, count.index)
  # #availability_zone = var.availability_zone[count.index]
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

resource "aws_instance" "example" {
  count = var.inst_count

  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = data.aws_subnet.name.id
  vpc_security_group_ids = [aws_security_group.example.id]
  #instance_type = var.instance_type
  # key_name      = var.key_name
  # availability_zone = element(var.availability_zone, count.index)
  # #availability_zone = var.availability_zone[count.index]
  tags = {
    Name        = "Terraform-EC2-Instance",
    Environment = "Development"
  }
}