variable "stack_name_prefix" {
}

variable "environment" {
}

variable "state_store" {
  description = "<account_id>-<stack_name_prefix>-<environment>-state-store"
}

variable "region" {
}

variable "vpc_id" {
}

variable "vpc_cidr" {
}

variable "private_subnet_ids" {
  description = "Comma separated list of subnet ids"
}
