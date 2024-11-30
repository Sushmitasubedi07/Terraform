terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
    access_key ="******" // not prefer to use the access_key and secret_key in a hard form
    secret_key = "******"

}
