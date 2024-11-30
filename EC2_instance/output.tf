output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}
output "instance_ip_addr_2" {
  value = aws_instance.web2.public_ip
}
