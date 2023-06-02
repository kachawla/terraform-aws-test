terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/aws"
      version = ">=4.0"
    }
  }
}

resource "aws_memorydb_cluster" "memorydb_cluster" {
  name                = var.memory_db_cluster_name
  node_type           = var.node_type
  num_shards           = var.num_shards
  num_replicas_per_shard = var.num_replicas_per_shard
  
  acl_name = var.acl_name

  subnet_group_name  = aws_memorydb_subnet_group.test_subnet_group.name
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_memorydb_subnet_group" "test_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = [aws_subnet.test_subnet.id]
}