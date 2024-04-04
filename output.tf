output "result" {
  value = {
    values = {
      host = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].address
      port = aws_memorydb_cluster.memorydb_cluster.cluster_endpoint[0].port
      tls = true
    }
  }
}
