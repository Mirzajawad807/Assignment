data "aws_secretsmanager_secret_version" "rds_secret" {
  secret_id = data.aws_secretsmanager_secret.rds_dev_creds.id
}

resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  name                 = var.name
  # count                = data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string ? 1 : 0
  # username             = data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_username
  # password             = data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_password
  # other RDS configuration here
  username = "${data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_username != "" ? data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_username : var.rds_username}"
  password = "${data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_password != "" ? data.aws_secretsmanager_secret_version.rds_dev_creds.secret_string.rds_password : var.rds_password}"

  vpc_security_group_ids = [aws_security_group.rds.id]
  subnet_ids = [aws_subnet.private.*.id]
  publicly_accessible = var.publicly_accessible
}

resource "aws_security_group" "rds" {
  name        = var.name
  description = "RDS security group"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }
}

resource "aws_subnet" "private" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
