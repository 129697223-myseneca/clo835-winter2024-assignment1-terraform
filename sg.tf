# Security Group for Dockerhost 
resource "aws_security_group" "dockerhost_sg" {
  name        = "${var.prefix}-dockerhost_sg"
  description = "Allow HTTP inbound traffic on 8081,8082,8083"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP on 8081"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP on 8082"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP on 8083"
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "outbound to all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.default_tags, {
      "Name" = "${var.prefix}-dockerhost_sg"
    }
  )
}
