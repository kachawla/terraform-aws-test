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

output "result" {
  value = {
    resources = [aws_memorydb_cluster.memorydb_cluster.id]
    values = {
      host = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].address
      port = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].port
    }
    secrets = {
      connectionString = format("rediss://%s:%d", aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].address, aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].port)
    }
  }
  sensitive = true
}
