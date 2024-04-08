# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      flask-rest-api = "bucket"
    }
  }
}

resource "aws_s3_bucket" "flask-rest-api" {
  bucket = var.bucket_name

  force_destroy = true

  tags = {
    Name           = "bucket for flask-rest-api"
    flask-rest-api = "bucket"
  }
}


resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.flask-rest-api.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.flask-rest-api.arn]
    }
    actions = [
      #"s3:ListBucket",
      #"s3:PutObject",
      #"s3:GetObject",
      #"s3:GetObjectVersion",
      "s3:*"
      #"sts:AssumeRole"
    ]
    resources = [
      aws_s3_bucket.flask-rest-api.arn,
      "${aws_s3_bucket.flask-rest-api.arn}/*",
    ]
  }
  version = "2012-10-17"
}

resource "aws_iam_user" "flask-rest-api" {
  name = var.user_name
}

resource "aws_iam_user_policy_attachment" "iam_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  user       = aws_iam_user.flask-rest-api.name
}
