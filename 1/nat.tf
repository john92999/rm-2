resource "aws_nat_gateway" "main_nat" {
    subnet_id = aws_subnet.main_db.id
    tags = {
      Name = "main_nat"
    }
    connectivity_type = "public"
}