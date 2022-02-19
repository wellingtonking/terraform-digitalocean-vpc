output "vpc_id" {
  value       = digitalocean_vpc.vpc.id
  description = "The ID of the VPC"
}
