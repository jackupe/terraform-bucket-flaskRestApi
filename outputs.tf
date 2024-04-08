# Output values

output "bucket_details" {
  description = "S3 bucket details."
  value = {
    arn    = aws_s3_bucket.flask-rest-api.arn,
    region = aws_s3_bucket.flask-rest-api.region,
    id     = aws_s3_bucket.flask-rest-api.id
  }
}

output "user_details" {
  description = "S3 bucket details."
  value = {
    arn  = aws_iam_user.flask-rest-api.arn,
    name = aws_iam_user.flask-rest-api.name,
    id   = aws_iam_user.flask-rest-api.id
  }
}
