terraform {
  backend "s3" {
    bucket     = "felimartina.terraform"
    key        = "demo-ci-cd/terraform.tfstate"
    region     = "us-east-1" # This cannot be set using var because it is too early in the process
    profile    = "pipe"
  }
}

provider "aws" {
  profile = "${var.PROFILE}"
  region  = "${var.REGION}"
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket     = "felimartina.terraform"
    key        = "demo-ci-cd/terraform.tfstate"
    region     = "${var.REGION}"
    profile    = "pipe"
  }
}