resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "Main DB Subnet Group"
  }
}

resource "aws_db_instance" "main_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"

  db_name                = "mydatabase"
  username               = "admin"
  password               = "Password123!"

  skip_final_snapshot    = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible    = false
  multi_az               = false

  tags = {
    Name = "Main RDS Instance"
  }
}
