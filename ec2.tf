module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  count                       = length(var.azs)
  name                        = "dhruvesh-sheladiya-ec2-${count.index}"
  instance_type               = var.instance_type
  ami                         = data.aws_ami.amazon_linux.id
  availability_zone           = element(var.azs, count.index)
  subnet_id                   = module.vpc.public_subnets[count.index]
  vpc_security_group_ids      = [aws_security_group.sg[count.index].id]
  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  ebs_block_device = [{
    device_name = "/dev/sdh"
    volume_size = 2
  }]

  tags = {
    Name  = "dhruvesh-sheladiya-ec2-${count.index}"
    Owner = "dhruvesh.sheladiya@intuitive.cloud"
  }
}