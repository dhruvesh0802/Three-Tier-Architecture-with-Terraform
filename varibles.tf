variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnet_names" {
  type    = list(string)
  default = ["sakshi-zalavadia-private-A", "sakshi-zalavadia-private-B", "sakshi-zalavadia-private-C"]
}

variable "public_subnet_names" {
  type    = list(string)
  default = ["sakshi-zalavadia-public-A", "sakshi-zalavadia-public-B", "sakshi-zalavadia-public-C"]
}

######### EC2 ##########

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-0aa7d40eeae50c9a9"
}

variable "sg_name_prefix" {
  type    = string
  default = "sakshi-zalavadai-sg"
}

variable "sg_ingress_rules" {
  default = [
    { type = "tcp", from_port = 80, to_port = 80, cidr_blocks = ["0.0.0.0/0"] },
    { type = "tcp", from_port = 22, to_port = 22, cidr_blocks = ["0.0.0.0/0"] }
  ]
}

variable "custom_ami" {
  type    = string
  default = "ami-05752f8e428a5c396"
}