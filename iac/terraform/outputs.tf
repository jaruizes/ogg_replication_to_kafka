output "vpc_id" {
  value = module.vpc.id
}

output "oracle_ggc_public_ip" {
  value = module.goldengate.goldengate_classic_public_ip
}
output "oracle_ggc_private_ip" {
  value = module.goldengate.goldengate_classic_private_ip
}

output "oracle_gg_bigdata_public_ip" {
  value = module.goldengate.goldengate_bigdata_public_ip
}

output "oracle_gg_bigdata_private_ip" {
  value = module.goldengate.goldengate_bigdata_private_ip
}

output "oracle_endpoint" {
  value = module.rds.oracle_endpoint
}

output "msk_bootstrap_brokers" {
  description = "MSK endpoint"
  value       = module.mks.msk_bootstrap_brokers
}
