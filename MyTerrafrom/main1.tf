terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "5.91.0"
      }
    }
}    
provider "aws" {
region = "us-east-1"
}
resource "aws_s3_bucket" "example" {
bucket = "my-tf-test-bucketxxxaxaxaxaxasasassdadasd"
tags = {
Name = "My bucket"
Environment = "Stage"
 }
}