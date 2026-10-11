variable "job_lookup" {
  description = <<EOT
Map of job_lookup, attributes below
Optional:
    - job_id
    - job_name
    - name
    - job_settings (block):
        - created_time (optional)
        - creator_user_name (optional)
        - job_id (optional)
        - run_as_user_name (optional)
        - settings (optional, block):
            - continuous (optional, block):
                - pause_status (optional)
            - dbt_task (optional, block):
                - catalog (optional)
                - commands (required)
                - profiles_directory (optional)
                - project_directory (optional)
                - schema (optional)
                - source (optional)
                - warehouse_id (optional)
            - deployment (optional, block):
                - deployment_id (optional)
                - kind (required)
                - metadata_file_path (optional)
                - version_id (optional)
            - description (optional)
            - edit_mode (optional)
            - email_notifications (optional, block):
                - no_alert_for_skipped_runs (optional)
                - on_duration_warning_threshold_exceeded (optional)
                - on_failure (optional)
                - on_maintenance_complete (optional)
                - on_maintenance_start (optional)
                - on_start (optional)
                - on_streaming_backlog_exceeded (optional)
                - on_success (optional)
            - environment (optional, block):
                - environment_key (required)
                - spec (optional, block):
                    - base_environment (optional)
                    - client (optional)
                    - dependencies (optional)
                    - environment_version (optional)
                    - java_dependencies (optional)
                    - project_environment (optional)
            - existing_cluster_id (optional)
            - format (optional)
            - git_source (optional, block):
                - branch (optional)
                - commit (optional)
                - job_source (optional, block):
                    - dirty_state (optional)
                    - import_from_git_branch (required)
                    - job_config_path (required)
                - provider (optional)
                - tag (optional)
                - url (required)
            - health (optional, block):
                - rules (required, block):
                    - metric (required)
                    - op (required)
                    - value (required)
            - job_cluster (optional, block):
                - job_cluster_key (required)
                - new_cluster (required, block):
                    - apply_policy_default_values (optional)
                    - autoscale (optional, block):
                        - max_workers (optional)
                        - min_workers (optional)
                    - autotermination_minutes (optional)
                    - aws_attributes (optional, block):
                        - availability (optional)
                        - ebs_volume_count (optional)
                        - ebs_volume_size (optional)
                        - ebs_volume_type (optional)
                        - first_on_demand (optional)
                        - instance_profile_arn (optional)
                        - spot_bid_price_percent (optional)
                        - zone_id (optional)
                    - azure_attributes (optional, block):
                        - availability (optional)
                        - first_on_demand (optional)
                        - spot_bid_max_price (optional)
                    - cluster_id (optional)
                    - cluster_log_conf (optional, block):
                        - dbfs (optional, block):
                            - destination (required)
                        - s3 (optional, block):
                            - canned_acl (optional)
                            - destination (required)
                            - enable_encryption (optional)
                            - encryption_type (optional)
                            - endpoint (optional)
                            - kms_key (optional)
                            - region (optional)
                    - cluster_mount_info (optional, block):
                        - local_mount_dir_path (required)
                        - network_filesystem_info (required, block):
                            - mount_options (optional)
                            - server_address (required)
                        - remote_mount_dir_path (optional)
                    - cluster_name (optional)
                    - custom_tags (optional)
                    - data_security_mode (optional)
                    - docker_image (optional, block):
                        - basic_auth (optional, block):
                            - password (required)
                            - username (required)
                        - url (required)
                    - driver_instance_pool_id (optional)
                    - driver_node_type_id (optional)
                    - enable_elastic_disk (optional)
                    - enable_local_disk_encryption (optional)
                    - gcp_attributes (optional, block):
                        - availability (optional)
                        - boot_disk_size (optional)
                        - google_service_account (optional)
                        - local_ssd_count (optional)
                        - use_preemptible_executors (optional)
                        - zone_id (optional)
                    - idempotency_token (optional)
                    - init_scripts (optional, block):
                        - abfss (optional, block):
                            - destination (required)
                        - dbfs (optional, block):
                            - destination (required)
                        - file (optional, block):
                            - destination (required)
                        - gcs (optional, block):
                            - destination (required)
                        - s3 (optional, block):
                            - canned_acl (optional)
                            - destination (required)
                            - enable_encryption (optional)
                            - encryption_type (optional)
                            - endpoint (optional)
                            - kms_key (optional)
                            - region (optional)
                        - volumes (optional, block):
                            - destination (required)
                        - workspace (optional, block):
                            - destination (required)
                    - instance_pool_id (optional)
                    - node_type_id (optional)
                    - num_workers (required)
                    - policy_id (optional)
                    - runtime_engine (optional)
                    - single_user_name (optional)
                    - spark_conf (optional)
                    - spark_env_vars (optional)
                    - spark_version (optional)
                    - ssh_public_keys (optional)
                    - workload_type (optional, block):
                        - clients (required, block):
                            - jobs (optional)
                            - notebooks (optional)
            - library (optional, block):
                - cran (optional, block):
                    - package (required)
                    - repo (optional)
                - egg (optional)
                - jar (optional)
                - maven (optional, block):
                    - coordinates (required)
                    - exclusions (optional)
                    - repo (optional)
                - provider_config (optional, block):
                    - workspace_id (optional)
                - pypi (optional, block):
                    - package (required)
                    - repo (optional)
                - requirements (optional)
                - whl (optional)
            - max_concurrent_runs (optional)
            - max_retries (optional)
            - min_retry_interval_millis (optional)
            - name (optional)
            - new_cluster (optional, block):
                - apply_policy_default_values (optional)
                - autoscale (optional, block):
                    - max_workers (optional)
                    - min_workers (optional)
                - autotermination_minutes (optional)
                - aws_attributes (optional, block):
                    - availability (optional)
                    - ebs_volume_count (optional)
                    - ebs_volume_size (optional)
                    - ebs_volume_type (optional)
                    - first_on_demand (optional)
                    - instance_profile_arn (optional)
                    - spot_bid_price_percent (optional)
                    - zone_id (optional)
                - azure_attributes (optional, block):
                    - availability (optional)
                    - first_on_demand (optional)
                    - spot_bid_max_price (optional)
                - cluster_id (optional)
                - cluster_log_conf (optional, block):
                    - dbfs (optional, block):
                        - destination (required)
                    - s3 (optional, block):
                        - canned_acl (optional)
                        - destination (required)
                        - enable_encryption (optional)
                        - encryption_type (optional)
                        - endpoint (optional)
                        - kms_key (optional)
                        - region (optional)
                - cluster_mount_info (optional, block):
                    - local_mount_dir_path (required)
                    - network_filesystem_info (required, block):
                        - mount_options (optional)
                        - server_address (required)
                    - remote_mount_dir_path (optional)
                - cluster_name (optional)
                - custom_tags (optional)
                - data_security_mode (optional)
                - docker_image (optional, block):
                    - basic_auth (optional, block):
                        - password (required)
                        - username (required)
                    - url (required)
                - driver_instance_pool_id (optional)
                - driver_node_type_id (optional)
                - enable_elastic_disk (optional)
                - enable_local_disk_encryption (optional)
                - gcp_attributes (optional, block):
                    - availability (optional)
                    - boot_disk_size (optional)
                    - google_service_account (optional)
                    - local_ssd_count (optional)
                    - use_preemptible_executors (optional)
                    - zone_id (optional)
                - idempotency_token (optional)
                - init_scripts (optional, block):
                    - abfss (optional, block):
                        - destination (required)
                    - dbfs (optional, block):
                        - destination (required)
                    - file (optional, block):
                        - destination (required)
                    - gcs (optional, block):
                        - destination (required)
                    - s3 (optional, block):
                        - canned_acl (optional)
                        - destination (required)
                        - enable_encryption (optional)
                        - encryption_type (optional)
                        - endpoint (optional)
                        - kms_key (optional)
                        - region (optional)
                    - volumes (optional, block):
                        - destination (required)
                    - workspace (optional, block):
                        - destination (required)
                - instance_pool_id (optional)
                - node_type_id (optional)
                - num_workers (required)
                - policy_id (optional)
                - runtime_engine (optional)
                - single_user_name (optional)
                - spark_conf (optional)
                - spark_env_vars (optional)
                - spark_version (optional)
                - ssh_public_keys (optional)
                - workload_type (optional, block):
                    - clients (required, block):
                        - jobs (optional)
                        - notebooks (optional)
            - notebook_task (optional, block):
                - base_parameters (optional)
                - notebook_path (required)
                - source (optional)
                - warehouse_id (optional)
            - notification_settings (optional, block):
                - no_alert_for_canceled_runs (optional)
                - no_alert_for_skipped_runs (optional)
            - parameter (optional, block):
                - default (required)
                - name (required)
            - pipeline_task (optional, block):
                - full_refresh (optional)
                - pipeline_id (required)
            - python_wheel_task (optional, block):
                - entry_point (optional)
                - named_parameters (optional)
                - package_name (optional)
                - parameters (optional)
            - queue (optional, block):
                - enabled (required)
            - retry_on_timeout (optional)
            - run_as (optional, block):
                - service_principal_name (optional)
                - user_name (optional)
            - run_job_task (optional, block):
                - job_id (required)
                - job_parameters (optional)
            - schedule (optional, block):
                - pause_status (optional)
                - quartz_cron_expression (required)
                - timezone_id (required)
            - spark_jar_task (optional, block):
                - jar_uri (optional)
                - main_class_name (optional)
                - parameters (optional)
            - spark_python_task (optional, block):
                - parameters (optional)
                - python_file (required)
                - source (optional)
            - spark_submit_task (optional, block):
                - parameters (optional)
            - tags (optional)
            - task (optional, block):
                - condition_task (optional, block):
                    - left (required)
                    - op (required)
                    - right (required)
                - dashboard_task (optional, block):
                    - dashboard_id (optional)
                    - filters (optional)
                    - subscription (optional, block):
                        - custom_subject (optional)
                        - paused (optional)
                        - subscribers (optional, block):
                            - destination_id (optional)
                            - user_name (optional)
                    - warehouse_id (optional)
                - dbt_task (optional, block):
                    - catalog (optional)
                    - commands (required)
                    - profiles_directory (optional)
                    - project_directory (optional)
                    - schema (optional)
                    - source (optional)
                    - warehouse_id (optional)
                - depends_on (optional, block):
                    - outcome (optional)
                    - task_key (required)
                - description (optional)
                - email_notifications (optional, block):
                    - no_alert_for_skipped_runs (optional)
                    - on_duration_warning_threshold_exceeded (optional)
                    - on_failure (optional)
                    - on_maintenance_complete (optional)
                    - on_maintenance_start (optional)
                    - on_start (optional)
                    - on_streaming_backlog_exceeded (optional)
                    - on_success (optional)
                - environment_key (optional)
                - existing_cluster_id (optional)
                - for_each_task (optional, block):
                    - concurrency (optional)
                    - inputs (required)
                    - task (required, block):
                        - condition_task (optional, block):
                            - left (required)
                            - op (required)
                            - right (required)
                        - dashboard_task (optional, block):
                            - dashboard_id (optional)
                            - filters (optional)
                            - subscription (optional, block):
                                - custom_subject (optional)
                                - paused (optional)
                                - subscribers (optional, block):
                                    - destination_id (optional)
                                    - user_name (optional)
                            - warehouse_id (optional)
                        - dbt_task (optional, block):
                            - catalog (optional)
                            - commands (required)
                            - profiles_directory (optional)
                            - project_directory (optional)
                            - schema (optional)
                            - source (optional)
                            - warehouse_id (optional)
                        - depends_on (optional, block):
                            - outcome (optional)
                            - task_key (required)
                        - description (optional)
                        - email_notifications (optional, block):
                            - no_alert_for_skipped_runs (optional)
                            - on_duration_warning_threshold_exceeded (optional)
                            - on_failure (optional)
                            - on_maintenance_complete (optional)
                            - on_maintenance_start (optional)
                            - on_start (optional)
                            - on_streaming_backlog_exceeded (optional)
                            - on_success (optional)
                        - environment_key (optional)
                        - existing_cluster_id (optional)
                        - health (optional, block):
                            - rules (required, block):
                                - metric (required)
                                - op (required)
                                - value (required)
                        - job_cluster_key (optional)
                        - library (optional, block):
                            - cran (optional, block):
                                - package (required)
                                - repo (optional)
                            - egg (optional)
                            - jar (optional)
                            - maven (optional, block):
                                - coordinates (required)
                                - exclusions (optional)
                                - repo (optional)
                            - provider_config (optional, block):
                                - workspace_id (optional)
                            - pypi (optional, block):
                                - package (required)
                                - repo (optional)
                            - requirements (optional)
                            - whl (optional)
                        - max_retries (optional)
                        - min_retry_interval_millis (optional)
                        - new_cluster (optional, block):
                            - apply_policy_default_values (optional)
                            - autoscale (optional, block):
                                - max_workers (optional)
                                - min_workers (optional)
                            - autotermination_minutes (optional)
                            - aws_attributes (optional, block):
                                - availability (optional)
                                - ebs_volume_count (optional)
                                - ebs_volume_size (optional)
                                - ebs_volume_type (optional)
                                - first_on_demand (optional)
                                - instance_profile_arn (optional)
                                - spot_bid_price_percent (optional)
                                - zone_id (optional)
                            - azure_attributes (optional, block):
                                - availability (optional)
                                - first_on_demand (optional)
                                - spot_bid_max_price (optional)
                            - cluster_id (optional)
                            - cluster_log_conf (optional, block):
                                - dbfs (optional, block):
                                    - destination (required)
                                - s3 (optional, block):
                                    - canned_acl (optional)
                                    - destination (required)
                                    - enable_encryption (optional)
                                    - encryption_type (optional)
                                    - endpoint (optional)
                                    - kms_key (optional)
                                    - region (optional)
                            - cluster_mount_info (optional, block):
                                - local_mount_dir_path (required)
                                - network_filesystem_info (required, block):
                                    - mount_options (optional)
                                    - server_address (required)
                                - remote_mount_dir_path (optional)
                            - cluster_name (optional)
                            - custom_tags (optional)
                            - data_security_mode (optional)
                            - docker_image (optional, block):
                                - basic_auth (optional, block):
                                    - password (required)
                                    - username (required)
                                - url (required)
                            - driver_instance_pool_id (optional)
                            - driver_node_type_id (optional)
                            - enable_elastic_disk (optional)
                            - enable_local_disk_encryption (optional)
                            - gcp_attributes (optional, block):
                                - availability (optional)
                                - boot_disk_size (optional)
                                - google_service_account (optional)
                                - local_ssd_count (optional)
                                - use_preemptible_executors (optional)
                                - zone_id (optional)
                            - idempotency_token (optional)
                            - init_scripts (optional, block):
                                - abfss (optional, block):
                                    - destination (required)
                                - dbfs (optional, block):
                                    - destination (required)
                                - file (optional, block):
                                    - destination (required)
                                - gcs (optional, block):
                                    - destination (required)
                                - s3 (optional, block):
                                    - canned_acl (optional)
                                    - destination (required)
                                    - enable_encryption (optional)
                                    - encryption_type (optional)
                                    - endpoint (optional)
                                    - kms_key (optional)
                                    - region (optional)
                                - volumes (optional, block):
                                    - destination (required)
                                - workspace (optional, block):
                                    - destination (required)
                            - instance_pool_id (optional)
                            - node_type_id (optional)
                            - num_workers (required)
                            - policy_id (optional)
                            - runtime_engine (optional)
                            - single_user_name (optional)
                            - spark_conf (optional)
                            - spark_env_vars (optional)
                            - spark_version (optional)
                            - ssh_public_keys (optional)
                            - workload_type (optional, block):
                                - clients (required, block):
                                    - jobs (optional)
                                    - notebooks (optional)
                        - notebook_task (optional, block):
                            - base_parameters (optional)
                            - notebook_path (required)
                            - source (optional)
                            - warehouse_id (optional)
                        - notification_settings (optional, block):
                            - alert_on_last_attempt (optional)
                            - no_alert_for_canceled_runs (optional)
                            - no_alert_for_skipped_runs (optional)
                        - pipeline_task (optional, block):
                            - full_refresh (optional)
                            - pipeline_id (required)
                        - power_bi_task (optional, block):
                            - connection_resource_name (optional)
                            - power_bi_model (optional, block):
                                - authentication_method (optional)
                                - model_name (optional)
                                - overwrite_existing (optional)
                                - storage_mode (optional)
                                - workspace_name (optional)
                            - refresh_after_update (optional)
                            - tables (optional, block):
                                - catalog (optional)
                                - name (optional)
                                - schema (optional)
                                - storage_mode (optional)
                            - warehouse_id (optional)
                        - python_wheel_task (optional, block):
                            - entry_point (optional)
                            - named_parameters (optional)
                            - package_name (optional)
                            - parameters (optional)
                        - retry_on_timeout (optional)
                        - run_if (optional)
                        - run_job_task (optional, block):
                            - job_id (required)
                            - job_parameters (optional)
                        - spark_jar_task (optional, block):
                            - jar_uri (optional)
                            - main_class_name (optional)
                            - parameters (optional)
                        - spark_python_task (optional, block):
                            - parameters (optional)
                            - python_file (required)
                            - source (optional)
                        - spark_submit_task (optional, block):
                            - parameters (optional)
                        - sql_task (optional, block):
                            - alert (optional, block):
                                - alert_id (required)
                                - pause_subscriptions (optional)
                                - subscriptions (optional, block):
                                    - destination_id (optional)
                                    - user_name (optional)
                            - dashboard (optional, block):
                                - custom_subject (optional)
                                - dashboard_id (required)
                                - pause_subscriptions (optional)
                                - subscriptions (optional, block):
                                    - destination_id (optional)
                                    - user_name (optional)
                            - file (optional, block):
                                - path (required)
                                - source (optional)
                            - parameters (optional)
                            - query (optional, block):
                                - query_id (required)
                            - warehouse_id (required)
                        - task_key (required)
                        - timeout_seconds (optional)
                        - webhook_notifications (optional, block):
                            - on_duration_warning_threshold_exceeded (optional, block):
                                - id (required)
                            - on_failure (optional, block):
                                - id (required)
                            - on_maintenance_complete (optional, block):
                                - id (required)
                            - on_maintenance_start (optional, block):
                                - id (required)
                            - on_start (optional, block):
                                - id (required)
                            - on_streaming_backlog_exceeded (optional, block):
                                - id (required)
                            - on_success (optional, block):
                                - id (required)
                - health (optional, block):
                    - rules (required, block):
                        - metric (required)
                        - op (required)
                        - value (required)
                - job_cluster_key (optional)
                - library (optional, block):
                    - cran (optional, block):
                        - package (required)
                        - repo (optional)
                    - egg (optional)
                    - jar (optional)
                    - maven (optional, block):
                        - coordinates (required)
                        - exclusions (optional)
                        - repo (optional)
                    - provider_config (optional, block):
                        - workspace_id (optional)
                    - pypi (optional, block):
                        - package (required)
                        - repo (optional)
                    - requirements (optional)
                    - whl (optional)
                - max_retries (optional)
                - min_retry_interval_millis (optional)
                - new_cluster (optional, block):
                    - apply_policy_default_values (optional)
                    - autoscale (optional, block):
                        - max_workers (optional)
                        - min_workers (optional)
                    - autotermination_minutes (optional)
                    - aws_attributes (optional, block):
                        - availability (optional)
                        - ebs_volume_count (optional)
                        - ebs_volume_size (optional)
                        - ebs_volume_type (optional)
                        - first_on_demand (optional)
                        - instance_profile_arn (optional)
                        - spot_bid_price_percent (optional)
                        - zone_id (optional)
                    - azure_attributes (optional, block):
                        - availability (optional)
                        - first_on_demand (optional)
                        - spot_bid_max_price (optional)
                    - cluster_id (optional)
                    - cluster_log_conf (optional, block):
                        - dbfs (optional, block):
                            - destination (required)
                        - s3 (optional, block):
                            - canned_acl (optional)
                            - destination (required)
                            - enable_encryption (optional)
                            - encryption_type (optional)
                            - endpoint (optional)
                            - kms_key (optional)
                            - region (optional)
                    - cluster_mount_info (optional, block):
                        - local_mount_dir_path (required)
                        - network_filesystem_info (required, block):
                            - mount_options (optional)
                            - server_address (required)
                        - remote_mount_dir_path (optional)
                    - cluster_name (optional)
                    - custom_tags (optional)
                    - data_security_mode (optional)
                    - docker_image (optional, block):
                        - basic_auth (optional, block):
                            - password (required)
                            - username (required)
                        - url (required)
                    - driver_instance_pool_id (optional)
                    - driver_node_type_id (optional)
                    - enable_elastic_disk (optional)
                    - enable_local_disk_encryption (optional)
                    - gcp_attributes (optional, block):
                        - availability (optional)
                        - boot_disk_size (optional)
                        - google_service_account (optional)
                        - local_ssd_count (optional)
                        - use_preemptible_executors (optional)
                        - zone_id (optional)
                    - idempotency_token (optional)
                    - init_scripts (optional, block):
                        - abfss (optional, block):
                            - destination (required)
                        - dbfs (optional, block):
                            - destination (required)
                        - file (optional, block):
                            - destination (required)
                        - gcs (optional, block):
                            - destination (required)
                        - s3 (optional, block):
                            - canned_acl (optional)
                            - destination (required)
                            - enable_encryption (optional)
                            - encryption_type (optional)
                            - endpoint (optional)
                            - kms_key (optional)
                            - region (optional)
                        - volumes (optional, block):
                            - destination (required)
                        - workspace (optional, block):
                            - destination (required)
                    - instance_pool_id (optional)
                    - node_type_id (optional)
                    - num_workers (required)
                    - policy_id (optional)
                    - runtime_engine (optional)
                    - single_user_name (optional)
                    - spark_conf (optional)
                    - spark_env_vars (optional)
                    - spark_version (optional)
                    - ssh_public_keys (optional)
                    - workload_type (optional, block):
                        - clients (required, block):
                            - jobs (optional)
                            - notebooks (optional)
                - notebook_task (optional, block):
                    - base_parameters (optional)
                    - notebook_path (required)
                    - source (optional)
                    - warehouse_id (optional)
                - notification_settings (optional, block):
                    - alert_on_last_attempt (optional)
                    - no_alert_for_canceled_runs (optional)
                    - no_alert_for_skipped_runs (optional)
                - pipeline_task (optional, block):
                    - full_refresh (optional)
                    - pipeline_id (required)
                - power_bi_task (optional, block):
                    - connection_resource_name (optional)
                    - power_bi_model (optional, block):
                        - authentication_method (optional)
                        - model_name (optional)
                        - overwrite_existing (optional)
                        - storage_mode (optional)
                        - workspace_name (optional)
                    - refresh_after_update (optional)
                    - tables (optional, block):
                        - catalog (optional)
                        - name (optional)
                        - schema (optional)
                        - storage_mode (optional)
                    - warehouse_id (optional)
                - python_wheel_task (optional, block):
                    - entry_point (optional)
                    - named_parameters (optional)
                    - package_name (optional)
                    - parameters (optional)
                - retry_on_timeout (optional)
                - run_if (optional)
                - run_job_task (optional, block):
                    - job_id (required)
                    - job_parameters (optional)
                - spark_jar_task (optional, block):
                    - jar_uri (optional)
                    - main_class_name (optional)
                    - parameters (optional)
                - spark_python_task (optional, block):
                    - parameters (optional)
                    - python_file (required)
                    - source (optional)
                - spark_submit_task (optional, block):
                    - parameters (optional)
                - sql_task (optional, block):
                    - alert (optional, block):
                        - alert_id (required)
                        - pause_subscriptions (optional)
                        - subscriptions (optional, block):
                            - destination_id (optional)
                            - user_name (optional)
                    - dashboard (optional, block):
                        - custom_subject (optional)
                        - dashboard_id (required)
                        - pause_subscriptions (optional)
                        - subscriptions (optional, block):
                            - destination_id (optional)
                            - user_name (optional)
                    - file (optional, block):
                        - path (required)
                        - source (optional)
                    - parameters (optional)
                    - query (optional, block):
                        - query_id (required)
                    - warehouse_id (required)
                - task_key (required)
                - timeout_seconds (optional)
                - webhook_notifications (optional, block):
                    - on_duration_warning_threshold_exceeded (optional, block):
                        - id (required)
                    - on_failure (optional, block):
                        - id (required)
                    - on_maintenance_complete (optional, block):
                        - id (required)
                    - on_maintenance_start (optional, block):
                        - id (required)
                    - on_start (optional, block):
                        - id (required)
                    - on_streaming_backlog_exceeded (optional, block):
                        - id (required)
                    - on_success (optional, block):
                        - id (required)
            - timeout_seconds (optional)
            - trigger (optional, block):
                - file_arrival (optional, block):
                    - min_time_between_triggers_seconds (optional)
                    - url (required)
                    - wait_after_last_change_seconds (optional)
                - pause_status (optional)
                - periodic (optional, block):
                    - interval (required)
                    - unit (required)
                - table_update (optional, block):
                    - condition (optional)
                    - min_time_between_triggers_seconds (optional)
                    - table_names (required)
                    - wait_after_last_change_seconds (optional)
            - webhook_notifications (optional, block):
                - on_duration_warning_threshold_exceeded (optional, block):
                    - id (required)
                - on_failure (optional, block):
                    - id (required)
                - on_maintenance_complete (optional, block):
                    - id (required)
                - on_maintenance_start (optional, block):
                    - id (required)
                - on_start (optional, block):
                    - id (required)
                - on_streaming_backlog_exceeded (optional, block):
                    - id (required)
                - on_success (optional, block):
                    - id (required)
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    job_id   = optional(string)
    job_name = optional(string)
    name     = optional(string)
    job_settings = optional(object({
      created_time      = optional(number)
      creator_user_name = optional(string)
      job_id            = optional(number)
      run_as_user_name  = optional(string)
      settings = optional(object({
        continuous = optional(object({
          pause_status = optional(string)
        }))
        dbt_task = optional(object({
          catalog            = optional(string)
          commands           = list(string)
          profiles_directory = optional(string)
          project_directory  = optional(string)
          schema             = optional(string)
          source             = optional(string)
          warehouse_id       = optional(string)
        }))
        deployment = optional(object({
          deployment_id      = optional(string)
          kind               = string
          metadata_file_path = optional(string)
          version_id         = optional(string)
        }))
        description = optional(string)
        edit_mode   = optional(string)
        email_notifications = optional(object({
          no_alert_for_skipped_runs              = optional(bool)
          on_duration_warning_threshold_exceeded = optional(list(string))
          on_failure                             = optional(list(string))
          on_maintenance_complete                = optional(list(string))
          on_maintenance_start                   = optional(list(string))
          on_start                               = optional(list(string))
          on_streaming_backlog_exceeded          = optional(list(string))
          on_success                             = optional(list(string))
        }))
        environment = optional(list(object({
          environment_key = string
          spec = optional(object({
            base_environment    = optional(string)
            client              = optional(string)
            dependencies        = optional(list(string))
            environment_version = optional(string)
            java_dependencies   = optional(list(string))
            project_environment = optional(string)
          }))
        })))
        existing_cluster_id = optional(string)
        format              = optional(string)
        git_source = optional(object({
          branch = optional(string)
          commit = optional(string)
          job_source = optional(object({
            dirty_state            = optional(string)
            import_from_git_branch = string
            job_config_path        = string
          }))
          provider = optional(string)
          tag      = optional(string)
          url      = string
        }))
        health = optional(object({
          rules = list(object({
            metric = string
            op     = string
            value  = number
          }))
        }))
        job_cluster = optional(list(object({
          job_cluster_key = string
          new_cluster = object({
            apply_policy_default_values = optional(bool)
            autoscale = optional(object({
              max_workers = optional(number)
              min_workers = optional(number)
            }))
            autotermination_minutes = optional(number)
            aws_attributes = optional(object({
              availability           = optional(string)
              ebs_volume_count       = optional(number)
              ebs_volume_size        = optional(number)
              ebs_volume_type        = optional(string)
              first_on_demand        = optional(number)
              instance_profile_arn   = optional(string)
              spot_bid_price_percent = optional(number)
              zone_id                = optional(string)
            }))
            azure_attributes = optional(object({
              availability       = optional(string)
              first_on_demand    = optional(number)
              spot_bid_max_price = optional(number)
            }))
            cluster_id = optional(string)
            cluster_log_conf = optional(object({
              dbfs = optional(object({
                destination = string
              }))
              s3 = optional(object({
                canned_acl        = optional(string)
                destination       = string
                enable_encryption = optional(bool)
                encryption_type   = optional(string)
                endpoint          = optional(string)
                kms_key           = optional(string)
                region            = optional(string)
              }))
            }))
            cluster_mount_info = optional(list(object({
              local_mount_dir_path = string
              network_filesystem_info = object({
                mount_options  = optional(string)
                server_address = string
              })
              remote_mount_dir_path = optional(string)
            })))
            cluster_name       = optional(string)
            custom_tags        = optional(map(string))
            data_security_mode = optional(string)
            docker_image = optional(object({
              basic_auth = optional(object({
                password = string
                username = string
              }))
              url = string
            }))
            driver_instance_pool_id      = optional(string)
            driver_node_type_id          = optional(string)
            enable_elastic_disk          = optional(bool)
            enable_local_disk_encryption = optional(bool)
            gcp_attributes = optional(object({
              availability              = optional(string)
              boot_disk_size            = optional(number)
              google_service_account    = optional(string)
              local_ssd_count           = optional(number)
              use_preemptible_executors = optional(bool)
              zone_id                   = optional(string)
            }))
            idempotency_token = optional(string)
            init_scripts = optional(list(object({
              abfss = optional(object({
                destination = string
              }))
              dbfs = optional(object({
                destination = string
              }))
              file = optional(object({
                destination = string
              }))
              gcs = optional(object({
                destination = string
              }))
              s3 = optional(object({
                canned_acl        = optional(string)
                destination       = string
                enable_encryption = optional(bool)
                encryption_type   = optional(string)
                endpoint          = optional(string)
                kms_key           = optional(string)
                region            = optional(string)
              }))
              volumes = optional(object({
                destination = string
              }))
              workspace = optional(object({
                destination = string
              }))
            })))
            instance_pool_id = optional(string)
            node_type_id     = optional(string)
            num_workers      = number
            policy_id        = optional(string)
            runtime_engine   = optional(string)
            single_user_name = optional(string)
            spark_conf       = optional(map(string))
            spark_env_vars   = optional(map(string))
            spark_version    = optional(string)
            ssh_public_keys  = optional(list(string))
            workload_type = optional(object({
              clients = object({
                jobs      = optional(bool)
                notebooks = optional(bool)
              })
            }))
          })
        })))
        library = optional(list(object({
          cran = optional(object({
            package = string
            repo    = optional(string)
          }))
          egg = optional(string)
          jar = optional(string)
          maven = optional(object({
            coordinates = string
            exclusions  = optional(list(string))
            repo        = optional(string)
          }))
          provider_config = optional(object({
            workspace_id = optional(string)
          }))
          pypi = optional(object({
            package = string
            repo    = optional(string)
          }))
          requirements = optional(string)
          whl          = optional(string)
        })))
        max_concurrent_runs       = optional(number)
        max_retries               = optional(number)
        min_retry_interval_millis = optional(number)
        name                      = optional(string)
        new_cluster = optional(object({
          apply_policy_default_values = optional(bool)
          autoscale = optional(object({
            max_workers = optional(number)
            min_workers = optional(number)
          }))
          autotermination_minutes = optional(number)
          aws_attributes = optional(object({
            availability           = optional(string)
            ebs_volume_count       = optional(number)
            ebs_volume_size        = optional(number)
            ebs_volume_type        = optional(string)
            first_on_demand        = optional(number)
            instance_profile_arn   = optional(string)
            spot_bid_price_percent = optional(number)
            zone_id                = optional(string)
          }))
          azure_attributes = optional(object({
            availability       = optional(string)
            first_on_demand    = optional(number)
            spot_bid_max_price = optional(number)
          }))
          cluster_id = optional(string)
          cluster_log_conf = optional(object({
            dbfs = optional(object({
              destination = string
            }))
            s3 = optional(object({
              canned_acl        = optional(string)
              destination       = string
              enable_encryption = optional(bool)
              encryption_type   = optional(string)
              endpoint          = optional(string)
              kms_key           = optional(string)
              region            = optional(string)
            }))
          }))
          cluster_mount_info = optional(list(object({
            local_mount_dir_path = string
            network_filesystem_info = object({
              mount_options  = optional(string)
              server_address = string
            })
            remote_mount_dir_path = optional(string)
          })))
          cluster_name       = optional(string)
          custom_tags        = optional(map(string))
          data_security_mode = optional(string)
          docker_image = optional(object({
            basic_auth = optional(object({
              password = string
              username = string
            }))
            url = string
          }))
          driver_instance_pool_id      = optional(string)
          driver_node_type_id          = optional(string)
          enable_elastic_disk          = optional(bool)
          enable_local_disk_encryption = optional(bool)
          gcp_attributes = optional(object({
            availability              = optional(string)
            boot_disk_size            = optional(number)
            google_service_account    = optional(string)
            local_ssd_count           = optional(number)
            use_preemptible_executors = optional(bool)
            zone_id                   = optional(string)
          }))
          idempotency_token = optional(string)
          init_scripts = optional(list(object({
            abfss = optional(object({
              destination = string
            }))
            dbfs = optional(object({
              destination = string
            }))
            file = optional(object({
              destination = string
            }))
            gcs = optional(object({
              destination = string
            }))
            s3 = optional(object({
              canned_acl        = optional(string)
              destination       = string
              enable_encryption = optional(bool)
              encryption_type   = optional(string)
              endpoint          = optional(string)
              kms_key           = optional(string)
              region            = optional(string)
            }))
            volumes = optional(object({
              destination = string
            }))
            workspace = optional(object({
              destination = string
            }))
          })))
          instance_pool_id = optional(string)
          node_type_id     = optional(string)
          num_workers      = number
          policy_id        = optional(string)
          runtime_engine   = optional(string)
          single_user_name = optional(string)
          spark_conf       = optional(map(string))
          spark_env_vars   = optional(map(string))
          spark_version    = optional(string)
          ssh_public_keys  = optional(list(string))
          workload_type = optional(object({
            clients = object({
              jobs      = optional(bool)
              notebooks = optional(bool)
            })
          }))
        }))
        notebook_task = optional(object({
          base_parameters = optional(map(string))
          notebook_path   = string
          source          = optional(string)
          warehouse_id    = optional(string)
        }))
        notification_settings = optional(object({
          no_alert_for_canceled_runs = optional(bool)
          no_alert_for_skipped_runs  = optional(bool)
        }))
        parameter = optional(list(object({
          default = string
          name    = string
        })))
        pipeline_task = optional(object({
          full_refresh = optional(bool)
          pipeline_id  = string
        }))
        python_wheel_task = optional(object({
          entry_point      = optional(string)
          named_parameters = optional(map(string))
          package_name     = optional(string)
          parameters       = optional(list(string))
        }))
        queue = optional(object({
          enabled = bool
        }))
        retry_on_timeout = optional(bool)
        run_as = optional(object({
          service_principal_name = optional(string)
          user_name              = optional(string)
        }))
        run_job_task = optional(object({
          job_id         = number
          job_parameters = optional(map(string))
        }))
        schedule = optional(object({
          pause_status           = optional(string)
          quartz_cron_expression = string
          timezone_id            = string
        }))
        spark_jar_task = optional(object({
          jar_uri         = optional(string)
          main_class_name = optional(string)
          parameters      = optional(list(string))
        }))
        spark_python_task = optional(object({
          parameters  = optional(list(string))
          python_file = string
          source      = optional(string)
        }))
        spark_submit_task = optional(object({
          parameters = optional(list(string))
        }))
        tags = optional(map(string))
        task = optional(list(object({
          condition_task = optional(object({
            left  = string
            op    = string
            right = string
          }))
          dashboard_task = optional(object({
            dashboard_id = optional(string)
            filters      = optional(map(string))
            subscription = optional(object({
              custom_subject = optional(string)
              paused         = optional(bool)
              subscribers = optional(list(object({
                destination_id = optional(string)
                user_name      = optional(string)
              })))
            }))
            warehouse_id = optional(string)
          }))
          dbt_task = optional(object({
            catalog            = optional(string)
            commands           = list(string)
            profiles_directory = optional(string)
            project_directory  = optional(string)
            schema             = optional(string)
            source             = optional(string)
            warehouse_id       = optional(string)
          }))
          depends_on = optional(list(object({
            outcome  = optional(string)
            task_key = string
          })))
          description = optional(string)
          email_notifications = optional(object({
            no_alert_for_skipped_runs              = optional(bool)
            on_duration_warning_threshold_exceeded = optional(list(string))
            on_failure                             = optional(list(string))
            on_maintenance_complete                = optional(list(string))
            on_maintenance_start                   = optional(list(string))
            on_start                               = optional(list(string))
            on_streaming_backlog_exceeded          = optional(list(string))
            on_success                             = optional(list(string))
          }))
          environment_key     = optional(string)
          existing_cluster_id = optional(string)
          for_each_task = optional(object({
            concurrency = optional(number)
            inputs      = string
            task = object({
              condition_task = optional(object({
                left  = string
                op    = string
                right = string
              }))
              dashboard_task = optional(object({
                dashboard_id = optional(string)
                filters      = optional(map(string))
                subscription = optional(object({
                  custom_subject = optional(string)
                  paused         = optional(bool)
                  subscribers = optional(list(object({
                    destination_id = optional(string)
                    user_name      = optional(string)
                  })))
                }))
                warehouse_id = optional(string)
              }))
              dbt_task = optional(object({
                catalog            = optional(string)
                commands           = list(string)
                profiles_directory = optional(string)
                project_directory  = optional(string)
                schema             = optional(string)
                source             = optional(string)
                warehouse_id       = optional(string)
              }))
              depends_on = optional(list(object({
                outcome  = optional(string)
                task_key = string
              })))
              description = optional(string)
              email_notifications = optional(object({
                no_alert_for_skipped_runs              = optional(bool)
                on_duration_warning_threshold_exceeded = optional(list(string))
                on_failure                             = optional(list(string))
                on_maintenance_complete                = optional(list(string))
                on_maintenance_start                   = optional(list(string))
                on_start                               = optional(list(string))
                on_streaming_backlog_exceeded          = optional(list(string))
                on_success                             = optional(list(string))
              }))
              environment_key     = optional(string)
              existing_cluster_id = optional(string)
              health = optional(object({
                rules = list(object({
                  metric = string
                  op     = string
                  value  = number
                }))
              }))
              job_cluster_key = optional(string)
              library = optional(list(object({
                cran = optional(object({
                  package = string
                  repo    = optional(string)
                }))
                egg = optional(string)
                jar = optional(string)
                maven = optional(object({
                  coordinates = string
                  exclusions  = optional(list(string))
                  repo        = optional(string)
                }))
                provider_config = optional(object({
                  workspace_id = optional(string)
                }))
                pypi = optional(object({
                  package = string
                  repo    = optional(string)
                }))
                requirements = optional(string)
                whl          = optional(string)
              })))
              max_retries               = optional(number)
              min_retry_interval_millis = optional(number)
              new_cluster = optional(object({
                apply_policy_default_values = optional(bool)
                autoscale = optional(object({
                  max_workers = optional(number)
                  min_workers = optional(number)
                }))
                autotermination_minutes = optional(number)
                aws_attributes = optional(object({
                  availability           = optional(string)
                  ebs_volume_count       = optional(number)
                  ebs_volume_size        = optional(number)
                  ebs_volume_type        = optional(string)
                  first_on_demand        = optional(number)
                  instance_profile_arn   = optional(string)
                  spot_bid_price_percent = optional(number)
                  zone_id                = optional(string)
                }))
                azure_attributes = optional(object({
                  availability       = optional(string)
                  first_on_demand    = optional(number)
                  spot_bid_max_price = optional(number)
                }))
                cluster_id = optional(string)
                cluster_log_conf = optional(object({
                  dbfs = optional(object({
                    destination = string
                  }))
                  s3 = optional(object({
                    canned_acl        = optional(string)
                    destination       = string
                    enable_encryption = optional(bool)
                    encryption_type   = optional(string)
                    endpoint          = optional(string)
                    kms_key           = optional(string)
                    region            = optional(string)
                  }))
                }))
                cluster_mount_info = optional(list(object({
                  local_mount_dir_path = string
                  network_filesystem_info = object({
                    mount_options  = optional(string)
                    server_address = string
                  })
                  remote_mount_dir_path = optional(string)
                })))
                cluster_name       = optional(string)
                custom_tags        = optional(map(string))
                data_security_mode = optional(string)
                docker_image = optional(object({
                  basic_auth = optional(object({
                    password = string
                    username = string
                  }))
                  url = string
                }))
                driver_instance_pool_id      = optional(string)
                driver_node_type_id          = optional(string)
                enable_elastic_disk          = optional(bool)
                enable_local_disk_encryption = optional(bool)
                gcp_attributes = optional(object({
                  availability              = optional(string)
                  boot_disk_size            = optional(number)
                  google_service_account    = optional(string)
                  local_ssd_count           = optional(number)
                  use_preemptible_executors = optional(bool)
                  zone_id                   = optional(string)
                }))
                idempotency_token = optional(string)
                init_scripts = optional(list(object({
                  abfss = optional(object({
                    destination = string
                  }))
                  dbfs = optional(object({
                    destination = string
                  }))
                  file = optional(object({
                    destination = string
                  }))
                  gcs = optional(object({
                    destination = string
                  }))
                  s3 = optional(object({
                    canned_acl        = optional(string)
                    destination       = string
                    enable_encryption = optional(bool)
                    encryption_type   = optional(string)
                    endpoint          = optional(string)
                    kms_key           = optional(string)
                    region            = optional(string)
                  }))
                  volumes = optional(object({
                    destination = string
                  }))
                  workspace = optional(object({
                    destination = string
                  }))
                })))
                instance_pool_id = optional(string)
                node_type_id     = optional(string)
                num_workers      = number
                policy_id        = optional(string)
                runtime_engine   = optional(string)
                single_user_name = optional(string)
                spark_conf       = optional(map(string))
                spark_env_vars   = optional(map(string))
                spark_version    = optional(string)
                ssh_public_keys  = optional(list(string))
                workload_type = optional(object({
                  clients = object({
                    jobs      = optional(bool)
                    notebooks = optional(bool)
                  })
                }))
              }))
              notebook_task = optional(object({
                base_parameters = optional(map(string))
                notebook_path   = string
                source          = optional(string)
                warehouse_id    = optional(string)
              }))
              notification_settings = optional(object({
                alert_on_last_attempt      = optional(bool)
                no_alert_for_canceled_runs = optional(bool)
                no_alert_for_skipped_runs  = optional(bool)
              }))
              pipeline_task = optional(object({
                full_refresh = optional(bool)
                pipeline_id  = string
              }))
              power_bi_task = optional(object({
                connection_resource_name = optional(string)
                power_bi_model = optional(object({
                  authentication_method = optional(string)
                  model_name            = optional(string)
                  overwrite_existing    = optional(bool)
                  storage_mode          = optional(string)
                  workspace_name        = optional(string)
                }))
                refresh_after_update = optional(bool)
                tables = optional(list(object({
                  catalog      = optional(string)
                  name         = optional(string)
                  schema       = optional(string)
                  storage_mode = optional(string)
                })))
                warehouse_id = optional(string)
              }))
              python_wheel_task = optional(object({
                entry_point      = optional(string)
                named_parameters = optional(map(string))
                package_name     = optional(string)
                parameters       = optional(list(string))
              }))
              retry_on_timeout = optional(bool)
              run_if           = optional(string)
              run_job_task = optional(object({
                job_id         = number
                job_parameters = optional(map(string))
              }))
              spark_jar_task = optional(object({
                jar_uri         = optional(string)
                main_class_name = optional(string)
                parameters      = optional(list(string))
              }))
              spark_python_task = optional(object({
                parameters  = optional(list(string))
                python_file = string
                source      = optional(string)
              }))
              spark_submit_task = optional(object({
                parameters = optional(list(string))
              }))
              sql_task = optional(object({
                alert = optional(object({
                  alert_id            = string
                  pause_subscriptions = optional(bool)
                  subscriptions = optional(list(object({
                    destination_id = optional(string)
                    user_name      = optional(string)
                  })))
                }))
                dashboard = optional(object({
                  custom_subject      = optional(string)
                  dashboard_id        = string
                  pause_subscriptions = optional(bool)
                  subscriptions = optional(list(object({
                    destination_id = optional(string)
                    user_name      = optional(string)
                  })))
                }))
                file = optional(object({
                  path   = string
                  source = optional(string)
                }))
                parameters = optional(map(string))
                query = optional(object({
                  query_id = string
                }))
                warehouse_id = string
              }))
              task_key        = string
              timeout_seconds = optional(number)
              webhook_notifications = optional(object({
                on_duration_warning_threshold_exceeded = optional(list(object({
                  id = string
                })))
                on_failure = optional(list(object({
                  id = string
                })))
                on_maintenance_complete = optional(list(object({
                  id = string
                })))
                on_maintenance_start = optional(list(object({
                  id = string
                })))
                on_start = optional(list(object({
                  id = string
                })))
                on_streaming_backlog_exceeded = optional(list(object({
                  id = string
                })))
                on_success = optional(list(object({
                  id = string
                })))
              }))
            })
          }))
          health = optional(object({
            rules = list(object({
              metric = string
              op     = string
              value  = number
            }))
          }))
          job_cluster_key = optional(string)
          library = optional(list(object({
            cran = optional(object({
              package = string
              repo    = optional(string)
            }))
            egg = optional(string)
            jar = optional(string)
            maven = optional(object({
              coordinates = string
              exclusions  = optional(list(string))
              repo        = optional(string)
            }))
            provider_config = optional(object({
              workspace_id = optional(string)
            }))
            pypi = optional(object({
              package = string
              repo    = optional(string)
            }))
            requirements = optional(string)
            whl          = optional(string)
          })))
          max_retries               = optional(number)
          min_retry_interval_millis = optional(number)
          new_cluster = optional(object({
            apply_policy_default_values = optional(bool)
            autoscale = optional(object({
              max_workers = optional(number)
              min_workers = optional(number)
            }))
            autotermination_minutes = optional(number)
            aws_attributes = optional(object({
              availability           = optional(string)
              ebs_volume_count       = optional(number)
              ebs_volume_size        = optional(number)
              ebs_volume_type        = optional(string)
              first_on_demand        = optional(number)
              instance_profile_arn   = optional(string)
              spot_bid_price_percent = optional(number)
              zone_id                = optional(string)
            }))
            azure_attributes = optional(object({
              availability       = optional(string)
              first_on_demand    = optional(number)
              spot_bid_max_price = optional(number)
            }))
            cluster_id = optional(string)
            cluster_log_conf = optional(object({
              dbfs = optional(object({
                destination = string
              }))
              s3 = optional(object({
                canned_acl        = optional(string)
                destination       = string
                enable_encryption = optional(bool)
                encryption_type   = optional(string)
                endpoint          = optional(string)
                kms_key           = optional(string)
                region            = optional(string)
              }))
            }))
            cluster_mount_info = optional(list(object({
              local_mount_dir_path = string
              network_filesystem_info = object({
                mount_options  = optional(string)
                server_address = string
              })
              remote_mount_dir_path = optional(string)
            })))
            cluster_name       = optional(string)
            custom_tags        = optional(map(string))
            data_security_mode = optional(string)
            docker_image = optional(object({
              basic_auth = optional(object({
                password = string
                username = string
              }))
              url = string
            }))
            driver_instance_pool_id      = optional(string)
            driver_node_type_id          = optional(string)
            enable_elastic_disk          = optional(bool)
            enable_local_disk_encryption = optional(bool)
            gcp_attributes = optional(object({
              availability              = optional(string)
              boot_disk_size            = optional(number)
              google_service_account    = optional(string)
              local_ssd_count           = optional(number)
              use_preemptible_executors = optional(bool)
              zone_id                   = optional(string)
            }))
            idempotency_token = optional(string)
            init_scripts = optional(list(object({
              abfss = optional(object({
                destination = string
              }))
              dbfs = optional(object({
                destination = string
              }))
              file = optional(object({
                destination = string
              }))
              gcs = optional(object({
                destination = string
              }))
              s3 = optional(object({
                canned_acl        = optional(string)
                destination       = string
                enable_encryption = optional(bool)
                encryption_type   = optional(string)
                endpoint          = optional(string)
                kms_key           = optional(string)
                region            = optional(string)
              }))
              volumes = optional(object({
                destination = string
              }))
              workspace = optional(object({
                destination = string
              }))
            })))
            instance_pool_id = optional(string)
            node_type_id     = optional(string)
            num_workers      = number
            policy_id        = optional(string)
            runtime_engine   = optional(string)
            single_user_name = optional(string)
            spark_conf       = optional(map(string))
            spark_env_vars   = optional(map(string))
            spark_version    = optional(string)
            ssh_public_keys  = optional(list(string))
            workload_type = optional(object({
              clients = object({
                jobs      = optional(bool)
                notebooks = optional(bool)
              })
            }))
          }))
          notebook_task = optional(object({
            base_parameters = optional(map(string))
            notebook_path   = string
            source          = optional(string)
            warehouse_id    = optional(string)
          }))
          notification_settings = optional(object({
            alert_on_last_attempt      = optional(bool)
            no_alert_for_canceled_runs = optional(bool)
            no_alert_for_skipped_runs  = optional(bool)
          }))
          pipeline_task = optional(object({
            full_refresh = optional(bool)
            pipeline_id  = string
          }))
          power_bi_task = optional(object({
            connection_resource_name = optional(string)
            power_bi_model = optional(object({
              authentication_method = optional(string)
              model_name            = optional(string)
              overwrite_existing    = optional(bool)
              storage_mode          = optional(string)
              workspace_name        = optional(string)
            }))
            refresh_after_update = optional(bool)
            tables = optional(list(object({
              catalog      = optional(string)
              name         = optional(string)
              schema       = optional(string)
              storage_mode = optional(string)
            })))
            warehouse_id = optional(string)
          }))
          python_wheel_task = optional(object({
            entry_point      = optional(string)
            named_parameters = optional(map(string))
            package_name     = optional(string)
            parameters       = optional(list(string))
          }))
          retry_on_timeout = optional(bool)
          run_if           = optional(string)
          run_job_task = optional(object({
            job_id         = number
            job_parameters = optional(map(string))
          }))
          spark_jar_task = optional(object({
            jar_uri         = optional(string)
            main_class_name = optional(string)
            parameters      = optional(list(string))
          }))
          spark_python_task = optional(object({
            parameters  = optional(list(string))
            python_file = string
            source      = optional(string)
          }))
          spark_submit_task = optional(object({
            parameters = optional(list(string))
          }))
          sql_task = optional(object({
            alert = optional(object({
              alert_id            = string
              pause_subscriptions = optional(bool)
              subscriptions = optional(list(object({
                destination_id = optional(string)
                user_name      = optional(string)
              })))
            }))
            dashboard = optional(object({
              custom_subject      = optional(string)
              dashboard_id        = string
              pause_subscriptions = optional(bool)
              subscriptions = optional(list(object({
                destination_id = optional(string)
                user_name      = optional(string)
              })))
            }))
            file = optional(object({
              path   = string
              source = optional(string)
            }))
            parameters = optional(map(string))
            query = optional(object({
              query_id = string
            }))
            warehouse_id = string
          }))
          task_key        = string
          timeout_seconds = optional(number)
          webhook_notifications = optional(object({
            on_duration_warning_threshold_exceeded = optional(list(object({
              id = string
            })))
            on_failure = optional(list(object({
              id = string
            })))
            on_maintenance_complete = optional(list(object({
              id = string
            })))
            on_maintenance_start = optional(list(object({
              id = string
            })))
            on_start = optional(list(object({
              id = string
            })))
            on_streaming_backlog_exceeded = optional(list(object({
              id = string
            })))
            on_success = optional(list(object({
              id = string
            })))
          }))
        })))
        timeout_seconds = optional(number)
        trigger = optional(object({
          file_arrival = optional(object({
            min_time_between_triggers_seconds = optional(number)
            url                               = string
            wait_after_last_change_seconds    = optional(number)
          }))
          pause_status = optional(string)
          periodic = optional(object({
            interval = number
            unit     = string
          }))
          table_update = optional(object({
            condition                         = optional(string)
            min_time_between_triggers_seconds = optional(number)
            table_names                       = list(string)
            wait_after_last_change_seconds    = optional(number)
          }))
        }))
        webhook_notifications = optional(object({
          on_duration_warning_threshold_exceeded = optional(list(object({
            id = string
          })))
          on_failure = optional(list(object({
            id = string
          })))
          on_maintenance_complete = optional(list(object({
            id = string
          })))
          on_maintenance_start = optional(list(object({
            id = string
          })))
          on_start = optional(list(object({
            id = string
          })))
          on_streaming_backlog_exceeded = optional(list(object({
            id = string
          })))
          on_success = optional(list(object({
            id = string
          })))
        }))
      }))
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.health == null || (length(v.job_settings.settings.health.rules) >= 1)))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.job_cluster == null || alltrue([for item in v.job_settings.settings.job_cluster : (item.new_cluster.init_scripts == null || (length(item.new_cluster.init_scripts) <= 10))])))
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.new_cluster == null || (v.job_settings.settings.new_cluster.init_scripts == null || (length(v.job_settings.settings.new_cluster.init_scripts) <= 10))))
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.task == null || alltrue([for item in v.job_settings.settings.task : (item.for_each_task == null || (item.for_each_task.task.health == null || (length(item.for_each_task.task.health.rules) >= 1)))])))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.task == null || alltrue([for item in v.job_settings.settings.task : (item.for_each_task == null || (item.for_each_task.task.new_cluster == null || (item.for_each_task.task.new_cluster.init_scripts == null || (length(item.for_each_task.task.new_cluster.init_scripts) <= 10))))])))
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.task == null || alltrue([for item in v.job_settings.settings.task : (item.health == null || (length(item.health.rules) >= 1))])))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.job_lookup : (
        v.job_settings == null || (v.job_settings.settings == null || (v.job_settings.settings.task == null || alltrue([for item in v.job_settings.settings.task : (item.new_cluster == null || (item.new_cluster.init_scripts == null || (length(item.new_cluster.init_scripts) <= 10)))])))
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
}

