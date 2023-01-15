output "userdata" {
  value = aws_instance.web-server[0].user_data
}