output "elb-wordpress-url" {
  value = "http://${aws_elb.default.dns_name}"
}

