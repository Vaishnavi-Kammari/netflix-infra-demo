provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = ["JENKINS", "SERVER-1", "SERVER-2", "Monitoring server"]
}

resource "aws_instance" "one" {
  count         = 4
  ami           = "ami-0360c520857e3138f"
  instance_type = "t2.medium"
  key_name      = "vk"

  vpc_security_group_ids = [
    "sg-01bcb08f745b9c635"
  ]

  tags = {
    Name = var.instance_names[count.index]
  }
}
