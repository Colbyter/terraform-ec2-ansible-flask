output "ip" {
 value =  "${aws_instance.terratest.public_ip}"
}
