variable "name" {
  description = "Nome do projeto"
  type        = string
  default = "network-infra"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDRs para as subnets públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs para as subnets privadas"
  type        = list(string)
}
