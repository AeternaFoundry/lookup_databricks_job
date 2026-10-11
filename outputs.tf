output "job_lookup_id" {
  description = "Map of id values across all job_lookup, keyed the same as var.job_lookup except keys with no id are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "job_lookup_job_id" {
  description = "Map of job_id values across all job_lookup, keyed the same as var.job_lookup except keys with no job_id are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => v.job_id if v.job_id != null && length(v.job_id) > 0 }
}
output "job_lookup_job_name" {
  description = "Map of job_name values across all job_lookup, keyed the same as var.job_lookup except keys with no job_name are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => v.job_name if v.job_name != null && length(v.job_name) > 0 }
}
output "job_lookup_job_settings" {
  description = "Map of job_settings values across all job_lookup, keyed the same as var.job_lookup except keys with no job_settings are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => one(v.job_settings) if v.job_settings != null && length(v.job_settings) > 0 }
  sensitive   = true
}
output "job_lookup_name" {
  description = "Map of name values across all job_lookup, keyed the same as var.job_lookup except keys with no name are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "job_lookup_provider_config" {
  description = "Map of provider_config values across all job_lookup, keyed the same as var.job_lookup except keys with no provider_config are omitted"
  value       = { for k, v in data.databricks_job.job_lookup : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}

