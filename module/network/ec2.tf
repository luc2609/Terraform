resource "aws_key_pair" "key" {
  key_name   = "test_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web_instance" {
  ami                         = "ami-0533f2ba8a1995cf9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash -ex

  amazon-linux-extras install nginx1 -y
  echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
  systemctl enable nginx
  systemctl start nginx
  EOF

  tags = {
    "Name" : "Ec2 LucBt"
  }
}

