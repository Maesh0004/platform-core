
resource "aws_instance" "k8s_nodes" {

  count = var.node_count

  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = merge(
    local.common_tags,
    {
      Name = count.index == 0? "k8s-control-plane" : "k8s-worker-${count.index}"
    }
  )
}