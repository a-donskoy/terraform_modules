variable "instance_amis" {
  default = {
    us-west-2     = "ami-a9d276c9"
  }
}

variable "instance_key_name" {
    description = "SSH key pair"
    default = "terraform-temporary-key"
}

variable "aws_region" {
  default     = "us-west-2"
  description = "The region of AWS, for AMI lookups."
}

variable "servers" {
  default     = "1"
  description = "The number of  servers to launch."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS Instance type, if you change, make sure it is compatible with AMI, not all AMIs allow all instance types "
}

variable "project_maintainer" {
    description = "Whom we should address infra related questions"
    default = "infra team"
}

variable "project_name" {
    description = "Default project name"
    default = "common"
}


variable "service_name" {
    description = "Default service name"
    default = "web"
}
