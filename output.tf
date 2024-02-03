output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "dockerhost-ip" {
  value = aws_instance.dockerhost.public_ip

}

output "aws_ecr_repository" {
  value = aws_ecr_repository.ecr_repository.name
}
