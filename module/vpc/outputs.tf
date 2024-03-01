output "vpc_id" {
    value = data.aws_vpc.new-vpc.id 
}

output "subnet_ids" {
  value = aws_subnet.new-subnets[*].id
}