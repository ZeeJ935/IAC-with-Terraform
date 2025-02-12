resource "aws_s3_bucket" "zjbucketnew" {
  bucket = "zjbucketnew"
  tags = {
    Name = "zjbucketnew"
  }
}

resource "aws_s3_object" "upload_walterwhiteyo" {
  bucket = aws_s3_bucket.zjbucketnew.bucket
  key    = "walterwhiteyo.png"
  source = "${path.module}/walterwhiteyo.png"
}