# Define the provider
provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"   # Replace with your S3 bucket name
    key            = "terraform/state.tfstate"     # Path within the bucket
    region         = "us-west-2"                    # AWS region
    encrypt        = true                          # Optional: Enable server-side encryption
  }
}
