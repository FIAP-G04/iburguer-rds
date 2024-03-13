output "vpc_id" {
    value = data.aws_vpc.vpc.id 
}

output "subnet_ids" {
  value = data.aws_subnets.available-subnets.ids
}