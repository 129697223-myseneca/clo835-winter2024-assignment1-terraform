variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "Default availability zone"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Owner"   = "Cristina Castro"
    "Purpose" = "CLO835 Assignment1"
  }
  description = "Default tags"
}

variable "prefix" {
  type        = string
  default     = "clo835-assignment1"
  description = "Name prefix"
}

variable "public_subnet_cidr_blocks" {
  type        = string
  default     = "172.31.96.0/24"
  description = "Public Subnet CIDR"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance Type"
}
