terraform {

  backend "s3" {

    bucket = "student-devops-terraform-state-12345"

    key = "eks/terraform.tfstate"

    region = "us-east-1"

    dynamodb_table = "terraform-lock"

    encrypt = true

  }

}
