# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MANDATORY VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
variable "allocated_storage" {
  description = "The amount of storage to allocate for the RDS instance"
  default = 10
}

variable "engine" {
  description = "The RDS engine to use"
  default = "mysql"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  default = "db.t2.micro"
}

variable "name" {
  description = "The name of the RDS instance"
  type = string 
}

variable "rds_username" {
  description = "The username for the RDS instance"
  default = ""
}

variable "rds_password" {
  description = "The password for the RDS instance"
  default = ""
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# OPTIONAL VARIABLES (WITH DEFAULT VALUES)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

variable "vpc_security_group_ids" {
  description = "The security group ids for the RDS instance"
  default = []
}

variable "subnet_ids" {
  description = "The subnet ids for the RDS instance"
  default = []
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  default = false
}

variable "from_port" {
  description = "The from port for security group"
  default = 3306
}

variable "to_port" {
  description = "The to port for security group"
  default = 3306
}

variable "protocol" {
  description = "The protocol for security group"
  default = "tcp"
}

variable "cidr_blocks" {
  description = "Cidr blocks for security group"
  default = ["0.0.0.0/0"]
}


/*

You can use these variables to customize the RDS instance, such as the amount of storage, the engine, instance class, and the security group settings.
You can also add new variable like backup_retention_period, multi_az etc.

It is important to remember that RDS instances should be protected with strong passwords and appropriate security group rules, and encrypting sensitive data stored on RDS instances is also recommended to add security.
*/