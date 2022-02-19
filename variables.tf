variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_region" {
  description = "The region of the VPC"
  type        = string
}

variable "vpc_ip_range" {
  description = "The IP range (CIDR block) of the VPC"
  type        = string
}
