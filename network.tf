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

#resource "aws_internet_gateway" "vpc_igw" {
#  vpc_id = aws_vpc.main.id
#
#  tags = merge(
#    var.default_tags, {
#      Name = "${var.prefix}-igw"
#    }
#  )
#}

#resource "aws_route_table" "public_route_table" {
#  vpc_id = aws_vpc.main.id
#  tags = merge(
#    var.default_tags, {
#      Name = "${var.prefix}-public-route-table"
#    }
#  )
#}

#resource "aws_route" "public_route" {
#  route_table_id         = aws_route_table.public_route_table.id
#  destination_cidr_block = "0.0.0.0/0"
#  gateway_id             = aws_internet_gateway.vpc_igw.id
#}

#resource "aws_route_table_association" "public_route_table_association" {
#  route_table_id = aws_route_table.public_route_table.id
#  subnet_id      = aws_subnet.public_subnet.id
#}

#resource "aws_eip" "vpc_eip" {
#  domain     = "vpc"
#  depends_on = [aws_internet_gateway.vpc_igw]
#  tags = merge(
#    var.default_tags, {
#      Name = "${var.prefix}-eip"
#    }
#  )
#}

resource "aws_eip" "static_eip" {
  instance = aws_instance.dockerhost.id

  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-eip"
    }
  )
}
