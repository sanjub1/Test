provider "aws" {
  region = "us-east-1"  # Adjust the region as needed
}

resource "aws_s3_bucket" "hello_world_bucket" {
  bucket = "your-unique-bucket-name"  # Replace with a unique bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
