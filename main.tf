provider "aws" {
   
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region  = "${var.region}"
  profile = "terraform" 
}

resource "aws_instance" "terratest" {
  ami = "ami-0ac019f4fcb7cb7e6"
  key_name = "terr"
  instance_type = "t2.micro"  
  tags = {
    Name = "TerraForceOne"
  }
  vpc_security_group_ids = ["${aws_security_group.TerraSecG.id}"]
  connection {
  
   type = "ssh"
   user = "ubuntu"
   private_key = "${file(var.ssh_key)}"
   agent = false
  }
  
  provisioner "local-exec" {

  command = "redis-cli ping"  
}

   provisioner "file" {
      source = "test.py"
      destination = "test.py"
}

/*
 provisioner "remote-exec" {

  inline = [ 
            "sudo apt update -y",            
            "sudo apt install -y python3 python3-pip",
            "sudo pip3 install flask",
            "sudo pip3 install ansible"
]

}
*/

provisioner "local-exec" {
  
   command  = "sleep 30; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -v -i '${self.public_ip},' --key-file ../terr.pem ./ansible/config.yml -e 'ansible_python_interpreter=/usr/bin/python3'"
}


}




