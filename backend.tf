terraform {
  backend "s3" {
    bucket = "tf-training-backend-s3"
    key    = "sakshi-evaluation/terraform.tfstate"
    region = "us-east-1"
  }
}