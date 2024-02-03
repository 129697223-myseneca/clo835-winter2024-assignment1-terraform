#  Define the provider
provider "aws" {
  region = "us-east-1"
}
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}

# Configure Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-public_subnet"
    }
  )
}


resource "aws_eip" "static_eip" {
  instance = aws_instance.dockerhost.id

  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-eip"
    }
  )
}
