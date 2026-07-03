############################################
# Amazon ECR Repository
############################################

resource "aws_ecr_repository" "student_app" {

  name = "student-app"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {

    scan_on_push = true

  }

  encryption_configuration {

    encryption_type = "AES256"

  }

  tags = {

    Name        = "student-app-ecr"
    Environment = "Dev"

  }

}

############################################
# Lifecycle Policy
############################################

resource "aws_ecr_lifecycle_policy" "student_app" {

  repository = aws_ecr_repository.student_app.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF

}
