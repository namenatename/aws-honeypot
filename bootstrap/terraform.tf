terraform {
    required_version = ">= 1.2"
    
    #  backend "s3" {
    #     bucket         = "honeypot-devops-directive-tf-state-bucket"
    #     key            = "terraform.tfstate"
    #     region         = "us-west-1"
    #     dynamodb_table = "terraform-state-locking"
    #     encrypt        = true
    # }
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.92"
        }
    }
}

provider "aws" {
    region = "us-west-1"
}