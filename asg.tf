module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "dhruvesh-sheladiya-asg"

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  target_group_arns         = module.alb.target_group_arns
  vpc_zone_identifier       = module.vpc.public_subnets

  scaling_policies = {
    my-policy = {
      policy_type = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 80.0
      }
    }
  }

  # Launch template
  launch_template_name        = "dhruvesh-sheladiya-LT"
  launch_template_description = "Launch template"
  update_default_version      = true
  image_id          = data.aws_ami.custom.id
  instance_type     = var.instance_type
  ebs_optimized     = false
  enable_monitoring = true
  user_data         = base64encode("${file("./user_data.sh")}")
  security_groups   = [aws_security_group.sg[0].id]



  tag_specifications = [
    {
      resource_type = "instance"
      tags = {
        Name  = "Dhruvesh Sheladiya"
        Owner = "dhruvesh.sheladiya@intuitive.cloud"
      }
    },
    {
      resource_type = "volume"
      tags = {
        Name  = "Dhruvesh Sheladiya"
        Owner = "dhruvesh.sheladiya@intuitive.cloud"
      }
    }
  ]

  tags = {
    Name  = "Dhruvesh Sheladiya"
    Owner = "dhruvesh.sheladiya@intuitive.cloud"
  }
}
