output "goldengate_classic_public_ip" {
  description = "Oracle GGC public IP"
  value       = aws_instance.goldengate_classic.public_ip
}

output "goldengate_classic_private_ip" {
  description = "Oracle GGC private IP"
  value       = aws_instance.goldengate_classic.private_ip
}

output "goldengate_bigdata_public_ip" {
  description = "Oracle GG BigData public IP"
  value       = aws_instance.goldengate_bigdata.public_ip
}

output "goldengate_bigdata_private_ip" {
  description = "Oracle GG BigData private IP"
  value       = aws_instance.goldengate_bigdata.private_ip
}