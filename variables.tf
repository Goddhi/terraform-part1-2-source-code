variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_classiclink" {
  default = "false"
}

variable "enable_classiclink_dns_support" {
  default = "false"
}

variable "preferred_number_of_public_subnets" {
  default = 2
}

variable "preferred_number_of_private_subnets" {
  # default = 4  not setting a default alue because there are exactly 4 AZ in this region
  type        = number
  description = "Number of private subnets to create. If not specified, all available AZs will be used."
}

variable "name" {
  type = string
  default = "ACS"
}

variable "environment" {
  type = string
  default = "Production"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  default     = {}
}

variable "ami" {
  type = string
  description = "ami for launch temp"
}


variable "keypair" {
  type = string
  description = "key-pair for asg"
}

variable "master-username" {
  type = string
  description = "master password  for rds"
}


variable "master-password" {
  type = string
  description = "master password  for rds"
}
