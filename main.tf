# main.tf

provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_s3_bucket" "hello_world_bucket" {
  bucket = "sreyo-helloworld-bucket007" # Replace with your desired bucket name
  acl    = "private" # Set the ACL to "private" to avoid the InvalidBucketAclWithObjectOwnership error
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  versioning {
    enabled = true
  }
}
resource "null_resource" "copy_html" {
  provisioner "local-exec" {
    command = "aws s3 cp index.html s3://${aws_s3_bucket.hello_world_bucket.bucket}/"
  }

  depends_on = [aws_s3_bucket.hello_world_bucket]
}
