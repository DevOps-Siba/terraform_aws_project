output "vpc_id" {
  description = "The ID of the created vpc"
  value  = aws_vpc.example.id
}


output "ec2_id" {
  description = "the ID of the created EC2 instances"
  value = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value = aws_instance.example.public_ip
}
