output "oracle_endpoint" {
  description = "Oracle endpoint"
  value       = module.oracledb.db_instance_endpoint
}