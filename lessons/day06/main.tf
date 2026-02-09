resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami      = data.aws_ami.amazon_linux.id
  region = var.region

  tags = {
    Name = "${var.environment}-ec2-instance"
    Environment = var.environment

  }
}
