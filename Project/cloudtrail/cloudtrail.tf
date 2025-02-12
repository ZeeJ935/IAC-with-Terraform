resource "aws_s3_bucket" "zj_cloudtrail_logs_new" {
  bucket = "zj-cloudtrail-logs-new"
}

resource "aws_s3_bucket_policy" "zj_cloudtrail_logs_new_policy" {
  bucket = aws_s3_bucket.zj_cloudtrail_logs_new.id
  policy = data.aws_iam_policy_document.zj_cloudtrail_policy.json
}

resource "aws_cloudtrail" "zj_cloudtrail_new" {
  depends_on                   = [aws_s3_bucket_policy.zj_cloudtrail_logs_new_policy]
  name                         = "zj-cloudtrail-new"
  s3_bucket_name               = aws_s3_bucket.zj_cloudtrail_logs_new.id
  enable_logging               = true
  enable_log_file_validation   = true
  is_multi_region_trail        = true

  tags = {
    Name = "zj-cloudtrail-trail-new"
  }
}

data "aws_iam_policy_document" "zj_cloudtrail_policy" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.zj_cloudtrail_logs_new.arn]
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.zj_cloudtrail_logs_new.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}
