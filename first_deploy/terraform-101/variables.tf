variable "region" {
  description = "describe what region the instance will be deployed"
  default     = "us-east-1"
}
variable "name" {
  description = "name os the application"
  default     = "server01"
}

variable "env" {
  description = "name of the environment of the application "
  default     = "prod"
}

variable "ami" {
  description = "AWS AMI to be used"
  default     = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  description = "defines the hardware condiguration of the machine"
  default     = "t2.micro"
}

