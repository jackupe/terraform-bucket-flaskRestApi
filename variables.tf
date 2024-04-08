# Input variables

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "bucket_name" {
  description = "Bucket name."
  type        = string
  default     = "bucket-flask-rest-api"
}

variable "user_name" {
  description = "IAM user name."
  type        = string
  default     = "user-flask-rest-api"
}
