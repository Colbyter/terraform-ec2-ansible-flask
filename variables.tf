variable "access_key" {}

variable "secret_key" {}

variable "region" {

default = "us-east-1"

}

variable "http_port" {

default = 80

}

variable "ssh_port" {

default = 22

}

variable "ssh_key" {

description = "Absolute or relative path to your AWS pem file"

}
