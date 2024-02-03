terraform {
  backend "s3" {
    bucket = "clo835-assign1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
