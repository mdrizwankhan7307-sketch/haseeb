variable "repository_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "student-app"
}

variable "image_tag_mutability" {
  description = "Image tag mutability"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scanning"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Encryption type"
  type        = string
  default     = "AES256"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "Dev"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)

  default = {
    Name        = "student-app-ecr"
    Environment = "Dev"
  }
}
