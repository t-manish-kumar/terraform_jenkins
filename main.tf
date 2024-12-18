provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myalb_ec2_1" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update as per region)
  instance_type = "t2.micro"
  
  associate_public_ip_address = true
  tags = {
    Name = "ec2_Instance1"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello from the AZ1" > /var/www/html/index.html
              EOF
}
