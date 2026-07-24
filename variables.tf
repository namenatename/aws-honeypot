variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "region" {
    description = "default region"
    type        = string
    default     = "us-west-1"
}

variable "cidr_open" {
    description = "cidr range for network traffic to hit port 22"
    type        = string
    default     = "0.0.0.0/0"
}