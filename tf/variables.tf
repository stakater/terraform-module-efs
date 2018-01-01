variable "stack_name" {
}

variable "region" {
  default = ""
}

variable "s3_backend_bucket" {
  default = ""
}

variable "vpc_id" {
}

variable "vpc_cidr" {
}

variable "private_subnet_ids" {
  description = "Comma separated list of subnet ids"
}
