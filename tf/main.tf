provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" azs { }

terraform {
  backend "s3" {
    key    = "terraform_states/efs/terraform.tfstate"
  }
}

module "efs" {
  source = "github.com/stakater/blueprint-storage-aws.git//modules/efs/file-system?ref=1.0.0"
  name = "${var.stack_name_prefix}-${var.environment}"
  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"
}

module "efs-mount-targets" {
  source = "github.com/stakater/blueprint-storage-aws.git//modules/efs/mount-target?ref=v0.1.0"
  efs-id = "${module.efs.file-system-id}"
  subnets = "${var.private_subnet_ids}"
  # Send count for number of mount targets separately https://github.com/hashicorp/terraform/issues/3888
  mount-targets-count = "${min(length(split(",", var.private_subnet_ids)), length(data.aws_availability_zones.azs.names))}"
  security-groups = "${module.efs.efs-sg-id}"
}
