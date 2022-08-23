provider "aws" {
  skip_metadata_api_check = true


}

terraform {
  required_version = "~> 1.2.7"

  required_providers {
    aws    = "~> 4.0"
    random = {
      source    = "hashicorp/random"
      version   = "3.3.2"
    }
  }
}