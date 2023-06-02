output "host" {
  value = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].address
}

output "port" {
  value = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].port
}

output "connectionString" {
  value = format("rediss://%s:%d", aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].address, aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].port)
  sensitive = true
}