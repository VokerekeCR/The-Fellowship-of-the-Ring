# ATTACH THE INSTANCE PROFILE TO THE PUBLIC INSTANCE
resource "aws_instance" "my_public_server" {
  count                  = 1
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.pubic.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.my_keypair
  user_data              = data.template_file.user_data_public.rendered

  tags = {
    Name = "public_server_${count.index + 1}"
  }
  depends_on = [
    aws_instance.my_private_server
  ]
}

resource "aws_instance" "my_private_server" {
  count                  = var.number_of_instances
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.my_private_app_sg.id]
  key_name               = var.my_keypair
  user_data              = data.template_file.user_data_private.rendered

  tags = {
    Name = "private_server_${count.index + 1}"
  }
}

data "template_file" "user_data_public" {
  template = file("${path.cwd}/userdata-public.sh.tpl")
  vars = {
    private_key      = data.local_file.private_key.content
    private_ip1 = aws_instance.my_private_server.*.private_ip[0]
    private_ip2 = aws_instance.my_private_server.*.private_ip[1]
    private_ip3 = aws_instance.my_private_server.*.private_ip[2]
    private_ip4 = aws_instance.my_private_server.*.private_ip[3]
  }
}

data "template_file" "user_data_private" {
  template = file("${path.cwd}/userdata-private.sh.tpl")
  vars = {
    private_key      = data.local_file.private_key.content
  }
}