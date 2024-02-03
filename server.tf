data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "web_key" {
  key_name   = var.prefix
  public_key = file("${var.prefix}-key.pub")
}

data "aws_iam_instance_profile" "labrole" {
  name = "LabInstanceProfile"
}


resource "aws_instance" "dockerhost" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.web_key.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  security_groups             = [aws_security_group.dockerhost_sg.id]
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_tokens = "required"
  }
  lifecycle {
    create_before_destroy = true
  }

  iam_instance_profile = data.aws_iam_instance_profile.labrole.name
  
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-dockerhost"
    }
  )
}

resource "aws_ecr_repository" "ecr_repository" {
  name = "clo835-assignment1"

  image_scanning_configuration {
    scan_on_push = true
  }
}
