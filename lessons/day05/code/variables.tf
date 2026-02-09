variable "region" {
  description = "The AWS region where resources will be created"
  type    = string
  default = "ap-south-1"
}
variable "channel_name" {
  description = "this is for name pupose"
  type = string
  default = "siba-tf-bucket-2026"
}
variable "instance_type" {
  description = "The type of EC2 instance to creaate"
  type  = string
  default = "t2.micro"
}
variable "environment" {
  description = "The environment for which resources are being created"
  type    = string
  default = "dev"

}
