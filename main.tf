provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0fa3fe0fa7920f68e"
  instance_type          = "c7i-flex.large"
  key_name               = "terraform"
  vpc_security_group_ids = ["sg-0826049ef32541fe1"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
