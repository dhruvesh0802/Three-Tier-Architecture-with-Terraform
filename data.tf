data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

data "aws_ami" "custom" {
  most_recent = true

  filter {
    name   = "name"
    values = ["dhruvesh-sheladiya-ami"]
  }
}
