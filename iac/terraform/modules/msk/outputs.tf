output "msk_bootstrap_brokers" {
  description = "MSK endpoint"
  value       = aws_msk_cluster.msk_gg_demo.bootstrap_brokers
}