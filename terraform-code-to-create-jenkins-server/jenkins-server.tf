data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data = <<-EOL
 
	#!/bin/bash

	# install jenkins

	sudo yum update
	sudo wget -O /etc/yum.repos.d/jenkins.repo \
	    https://pkg.jenkins.io/redhat-stable/jenkins.repo
	sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
	sudo yum upgrade -y
	sudo amazon-linux-extras install java-openjdk11 -y
	sudo yum install jenkins -y
	sudo systemctl enable jenkins
	sudo systemctl start jenkins

	# install git
	sudo yum install git -y

	# install terraform

	sudo yum install -y yum-utils
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
	sudo yum -y install terraform

	# install kubectl

	sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
	sudo chmod +x ./kubectl
	sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
	                                         
   
  EOL
  tags = {
    Name = "${var.env_prefix}-server"
  }
}
