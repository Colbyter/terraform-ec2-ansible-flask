resource "aws_security_group" "TerraSecG" {

  name = "TerraSecG"
  ingress {
  
  from_port = "${var.http_port}"
  to_port = "${var.http_port}"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow SSH

  ingress {

  from_port = "${var.ssh_port}"  
  to_port = "${var.ssh_port}"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  
}
 
}

