resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "web tier"
  vpc_id      = "vpc-0a1b2c3d"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name        = "db-sg"
  description = "database tier"
  vpc_id      = "vpc-0a1b2c3d"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

resource "aws_db_instance" "orders" {
  identifier        = "orders-db"
  engine            = "postgres"
  instance_class    = "db.r5.large"
  allocated_storage = 100
}

resource "aws_autoscaling_group" "api" {
  name             = "api-asg"
  desired_capacity = 4
  min_size         = 2
  max_size         = 12
}

resource "aws_s3_bucket" "assets" {
  bucket = "acme-assets-prod"
}

resource "aws_s3_bucket_acl" "assets_acl" {
  bucket = aws_s3_bucket.assets.id
  acl    = "private"
}

resource "aws_ebs_volume" "data" {
  availability_zone = "us-east-1a"
  size              = 100
  type              = "gp3"
}

resource "aws_cloudwatch_log_group" "app" {
  name              = "/acme/app"
  retention_in_days = 30
}
