# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"

}
variable "subnet_ids" {
    type = list
  
}
variable "security_group" {
  type = string
}
variable "all-subnet_ids" {
    type = list
  
}
