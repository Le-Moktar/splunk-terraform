terraform {
  backend "s3" {
    bucket         = "wm-splunk-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "savetable"
    encrypt        = true
  }
}
