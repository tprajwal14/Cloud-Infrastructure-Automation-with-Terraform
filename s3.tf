resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-s3-bucket-prajal-take"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

# Enable versioning 
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
