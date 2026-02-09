terraform {
  backend "s3" {
    bucket       = "terra-state-bucket-26"  #aws s3 mb s3://terra-state-bucket-26 --region ap-south-1  cmd use for create  backend s3 bucket before you mention in youur backend optins.
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
