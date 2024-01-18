# main.tf

provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_s3_bucket" "hello_world_bucket" {
  bucket = "sreyo-helloworld-bucket007" # Replace with your desired bucket name
  acl    = "private" # Set the ACL to "private" to avoid the InvalidBucketAclWithObjectOwnership error

  force_destroy = true

  versioning {
    enabled = true
  }
}
