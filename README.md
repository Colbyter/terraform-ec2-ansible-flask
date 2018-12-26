# terraform-ec2-ansible-flask
 This demo uses Terraform to provision an EC2 instance with basic Security Group policy, then uses Ansible via `local-exec` provisioner to install dependencies and run a flask Countdown Timer Application.

What you will need:
1. AWS Account.
2. AWS Access, Secret keys and key pem file.
3. Install Terraform and Ansible.

You could either add the keys and path to pem file in the variables.tf file or pass them during `terraform apply` command.
