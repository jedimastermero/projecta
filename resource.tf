resource "aws_instance" "optimus" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  disable_api_termination = false
  tags = {

    Name = "optimus"
    owner = "autobots"
  }


}