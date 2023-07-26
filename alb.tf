module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "dhruvesh-sheladiya-alb"

  load_balancer_type    = "application"
  vpc_id                = module.vpc.vpc_id
  subnets               = module.vpc.public_subnets[*]
  create_security_group = false
  security_groups       = [aws_security_group.sg[0].id]


  target_groups = [
    {
      name_prefix      = "dhruvesh"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        matcher  = "200-399"
        path     = "/index.html"
        interval = 120
        timeout  = 30
      }
      targets = {
        my_target = {
          target_id = module.ec2_instance[0].id
          port      = 80
        }

        my_target = {
          target_id = module.ec2_instance[2].id
          port      = 80
        }

        my_other_target = {
          target_id = module.ec2_instance[1].id
          port      = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type        = "forward"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "dhruvesh-sheladiya-alb"
  }
}