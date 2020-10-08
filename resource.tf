resource "aws_instance" "optimus" {
  ami           = "ami-0f82752aa17ff8f5d"
  instance_type = "t2.micro"
  disable_api_termination = false
  vpc_security_group_ids = [aws_security_group.web_SG.id]
  tags = {

    Name = "optimus"
    owner = "autobots"

  }
  user_data = <<-EOF
               #!/bin/bash 
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF


}
resource "aws_security_group" "web_SG"{
name = "terraform_web_SG"
ingress {
  from_port = local.port

  protocol = "tcp"
  to_port = local.port
  cidr_blocks = ["0.0.0.0/0"]
}
}
output "ec2_pub_IP" {
  value = aws_instance.optimus.public_ip
}
locals {
  port = 8080

}