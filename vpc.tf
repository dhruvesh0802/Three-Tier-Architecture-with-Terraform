module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dhruvesh-sheladiya-vpc"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  private_subnet_names = var.private_subnet_names
  public_subnet_names  = var.public_subnet_names

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  igw_tags = {
    "Name" = "dhruvesh-sheladiya-igw"
  }

  nat_gateway_tags = {
    "Name" = "dhruvesh-sheladiya-ngw"
  }

  private_route_table_tags = {
    "Name" = "dhruvesh-sheladiya-private-route-table"
  }

  public_route_table_tags = {
    "Name" = "dhruvesh-sheladiya-public-route-table"
  }

  tags = {
    Owner = "dhruvesh.ssheladiya@intuitive.cloud"
  }
}