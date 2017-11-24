# You  will need to create a 'terraform.tfvars' file providing your secret keys and credentials
variable "PROFILE" {
  description = "You must have an aws profile in your local credentials files that has ACCESS_KEY, SECRET_KEY, and REGION set. Check README.md for details"
  default     = "pipe"
}

variable "REGION" {
  default = "us-east-1"
}

variable "ENV" {
  default = "staging"
}

variable "APP_NAME" {
  default = "demo-ci-cd"
}

variable "WEBSITE_BUCKET_NAME" {
  default = "demo-ci-cd-website"
}

variable "BUILDS_BUCKET_NAME" {
  default = "demo-ci-cd-builds"
}

variable "KEY_PAIR" {
  description = "Key Pair file name to ssh into instances."
  default     = "pipe"
}

variable "GITHUB_OWNER" {
  description = "Gtihub account. Also needs to provide GITHUB_TOKEN valid for this user. Should be in terraform.tfvars file."
}

variable "GITHUB_REPO" {
  default = "demo-ci-cd"
}

variable "GITHUB_BRANCH" {
  default = "master"
}

variable "GITHUB_TOKEN" {
  description = "OAuth token from github to grant CodePipeline access to your github repo. Should be in terraform.tfvars file."
}

variable "ADMIN_CIDRS" {
  type = "list"

  default = [
    "50.113.42.119/32" # Pipe's IP
  ]
}

variable "GLOBAL_TAGS" {
  type = "map"

  default = {
    "project"     = "demo-ci-cd"
    "createdBy"   = "terraform"
  }
}
