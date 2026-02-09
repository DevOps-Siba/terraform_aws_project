locals {
  env = var.environment
  bucket_name = "${var.channel_name}-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-vpc"
  
}
