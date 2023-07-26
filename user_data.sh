#!/bin/bash
# Install and configure Apache/Nginx or IIS
# Example for Apache:
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
# Create index.html file with the instance IP address
INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo "<h1>Instance IP: $INSTANCE_IP</h1>" | sudo tee /var/www/html/index.html