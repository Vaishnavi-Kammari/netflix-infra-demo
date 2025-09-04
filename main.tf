provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = ["JENKINS", "SERVER-1", "SERVER-2", "Monitoring server"]
}

resource "aws_instance" "one" {
  count         = 4
  ami           = "ami-0bbdd8c17ed981ef9"
  instance_type = "t2.medium"
  key_name      = "vk"

  vpc_security_group_ids = [
    "sg-0b99f3b86d7394196"
  ]

  tags = {
    Name = var.instance_names[count.index]
  }
}
