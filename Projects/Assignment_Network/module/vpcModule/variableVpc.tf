variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "12.0.0.0/16"
}