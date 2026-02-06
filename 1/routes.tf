resource "aws_route_table" "main_route" {
    vpc_id = aws_vpc.main.id
}
resource "aws_route" "main_public_route" {
    route_table_id = aws_route_table.main_route.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
}
resource "aws_route_table_association" "main_public_route_association" {
    route_table_id = aws_route_table.main_route.id
    subnet_id = aws_subnet.main_web.id
}
resource "aws_route" "main_private_route" {
    route_table_id = aws_route_table.main_route.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main_nat.id
}
resource "aws_route_table_association" "main_private_route_association" {
    route_table_id = aws_route_table.main_route.id
    subnet_id = aws_subnet.main_db.id
}