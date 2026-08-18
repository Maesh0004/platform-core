output "master_public_ip" {
  value = aws_instance.k8s_nodes[0].public_ip
}

output "worker_public_ip" {
  value = aws_instance.k8s_nodes[1].public_ip
}