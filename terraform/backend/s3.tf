##########################################
# S3 Bucket for Terraform State
##########################################

resource "aws_s3_bucket" "terraform_state" {

  bucket = "student-devops-terraform-state-12345"

  tags = {

    Name        = "Terraform-State"

    Environment = "Dev"

  }

}

##########################################
# Versioning
##########################################

resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {

    status = "Enabled"

  }

}

##########################################
# Server Side Encryption
##########################################

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {

  bucket = aws_s3_bucket.terraform_state.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

##########################################
# Block Public Access
##########################################

resource "aws_s3_bucket_public_access_block" "block" {

  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}
