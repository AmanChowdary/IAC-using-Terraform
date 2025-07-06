variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for RDS security group"
  type        = string
}

variable "allowed_cidrs" {
  description = "List of CIDR blocks allowed to access RDS"
  type        = list(string)
  default     = ["10.0.0.0/16"]
} 