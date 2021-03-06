# DATA SOURCE FOR AMI
data "aws_ami" "aws_basic_linux" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }
}

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "pubic" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}
data "local_file" "private_key" {
  filename = "/Users/victor.okereke/.ssh/aws_keypair.pem"
}

#data "local_file" "script" {
#filename = "${path.cwd}/ring.sh"
#}