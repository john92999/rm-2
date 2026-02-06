resource "aws_instance" "main_web_instance" {
    ami = "ami-0786adace1541ca80"
    instance_type = "t3.micro"
    key_name = aws_key_pair.main_key.key_name
    subnet_id = aws_subnet.main_web.id
    vpc_security_group_ids = [aws_security_group.main_sgw.id]
    associate_public_ip_address = true
    tags = {
      Name = "main_web_instance"
    }
}
resource "aws_instance" "main_db_instance" {
    ami = "ami-0786adace1541ca80"
    instance_type = "t3.micro"
    key_name = aws_key_pair.main_key.key_name
    subnet_id = aws_subnet.main_db.id
    vpc_security_group_ids = [aws_security_group.main_sgw]
    tags = {
     Name = "main_db_instance" 
    }
}
