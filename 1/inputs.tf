variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "vpc cidr value"
    type = string
}

variable "subnet_cidr" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    description = "subnet cidr"
    type = list(string)
}

variable "ports" {
    default = [22, 443, 8080, 80]
}

