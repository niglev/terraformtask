terraform {
  version = "~> 0.11.14"
}

provider "aws" {
  profile = "default"
  region  = "${var.aws_region}"
}
