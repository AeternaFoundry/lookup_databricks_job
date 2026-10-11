data "databricks_job" "job_lookup" {
  for_each = var.job_lookup

  job_id   = each.value.job_id
  job_name = each.value.job_name
  name     = each.value.name

  dynamic "job_settings" {
    for_each = each.value.job_settings != null ? [each.value.job_settings] : []
    content {
      created_time      = job_settings.value.created_time
      creator_user_name = job_settings.value.creator_user_name
      job_id            = job_settings.value.job_id
      run_as_user_name  = job_settings.value.run_as_user_name
      dynamic "settings" {
        for_each = job_settings.value.settings != null ? [job_settings.value.settings] : []
        content {
          dynamic "continuous" {
            for_each = settings.value.continuous != null ? [settings.value.continuous] : []
            content {
              pause_status = continuous.value.pause_status
            }
          }
          dynamic "dbt_task" {
            for_each = settings.value.dbt_task != null ? [settings.value.dbt_task] : []
            content {
              catalog            = dbt_task.value.catalog
              commands           = dbt_task.value.commands
              profiles_directory = dbt_task.value.profiles_directory
              project_directory  = dbt_task.value.project_directory
              schema             = dbt_task.value.schema
              source             = dbt_task.value.source
              warehouse_id       = dbt_task.value.warehouse_id
            }
          }
          dynamic "deployment" {
            for_each = settings.value.deployment != null ? [settings.value.deployment] : []
            content {
              deployment_id      = deployment.value.deployment_id
              kind               = deployment.value.kind
              metadata_file_path = deployment.value.metadata_file_path
              version_id         = deployment.value.version_id
            }
          }
          description = settings.value.description
          edit_mode   = settings.value.edit_mode
          dynamic "email_notifications" {
            for_each = settings.value.email_notifications != null ? [settings.value.email_notifications] : []
            content {
              no_alert_for_skipped_runs              = email_notifications.value.no_alert_for_skipped_runs
              on_duration_warning_threshold_exceeded = email_notifications.value.on_duration_warning_threshold_exceeded
              on_failure                             = email_notifications.value.on_failure
              on_maintenance_complete                = email_notifications.value.on_maintenance_complete
              on_maintenance_start                   = email_notifications.value.on_maintenance_start
              on_start                               = email_notifications.value.on_start
              on_streaming_backlog_exceeded          = email_notifications.value.on_streaming_backlog_exceeded
              on_success                             = email_notifications.value.on_success
            }
          }
          dynamic "environment" {
            for_each = settings.value.environment != null ? settings.value.environment : []
            content {
              environment_key = environment.value.environment_key
              dynamic "spec" {
                for_each = environment.value.spec != null ? [environment.value.spec] : []
                content {
                  base_environment    = spec.value.base_environment
                  client              = spec.value.client
                  dependencies        = spec.value.dependencies
                  environment_version = spec.value.environment_version
                  java_dependencies   = spec.value.java_dependencies
                  project_environment = spec.value.project_environment
                }
              }
            }
          }
          existing_cluster_id = settings.value.existing_cluster_id
          format              = settings.value.format
          dynamic "git_source" {
            for_each = settings.value.git_source != null ? [settings.value.git_source] : []
            content {
              branch = git_source.value.branch
              commit = git_source.value.commit
              dynamic "job_source" {
                for_each = git_source.value.job_source != null ? [git_source.value.job_source] : []
                content {
                  dirty_state            = job_source.value.dirty_state
                  import_from_git_branch = job_source.value.import_from_git_branch
                  job_config_path        = job_source.value.job_config_path
                }
              }
              provider = git_source.value.provider
              tag      = git_source.value.tag
              url      = git_source.value.url
            }
          }
          dynamic "health" {
            for_each = settings.value.health != null ? [settings.value.health] : []
            content {
              dynamic "rules" {
                for_each = health.value.rules
                content {
                  metric = rules.value.metric
                  op     = rules.value.op
                  value  = rules.value.value
                }
              }
            }
          }
          dynamic "job_cluster" {
            for_each = settings.value.job_cluster != null ? settings.value.job_cluster : []
            content {
              job_cluster_key = job_cluster.value.job_cluster_key
              new_cluster {
                apply_policy_default_values = job_cluster.value.new_cluster.apply_policy_default_values
                dynamic "autoscale" {
                  for_each = job_cluster.value.new_cluster.autoscale != null ? [job_cluster.value.new_cluster.autoscale] : []
                  content {
                    max_workers = autoscale.value.max_workers
                    min_workers = autoscale.value.min_workers
                  }
                }
                autotermination_minutes = job_cluster.value.new_cluster.autotermination_minutes
                dynamic "aws_attributes" {
                  for_each = job_cluster.value.new_cluster.aws_attributes != null ? [job_cluster.value.new_cluster.aws_attributes] : []
                  content {
                    availability           = aws_attributes.value.availability
                    ebs_volume_count       = aws_attributes.value.ebs_volume_count
                    ebs_volume_size        = aws_attributes.value.ebs_volume_size
                    ebs_volume_type        = aws_attributes.value.ebs_volume_type
                    first_on_demand        = aws_attributes.value.first_on_demand
                    instance_profile_arn   = aws_attributes.value.instance_profile_arn
                    spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
                    zone_id                = aws_attributes.value.zone_id
                  }
                }
                dynamic "azure_attributes" {
                  for_each = job_cluster.value.new_cluster.azure_attributes != null ? [job_cluster.value.new_cluster.azure_attributes] : []
                  content {
                    availability       = azure_attributes.value.availability
                    first_on_demand    = azure_attributes.value.first_on_demand
                    spot_bid_max_price = azure_attributes.value.spot_bid_max_price
                  }
                }
                cluster_id = job_cluster.value.new_cluster.cluster_id
                dynamic "cluster_log_conf" {
                  for_each = job_cluster.value.new_cluster.cluster_log_conf != null ? [job_cluster.value.new_cluster.cluster_log_conf] : []
                  content {
                    dynamic "dbfs" {
                      for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
                      content {
                        destination = dbfs.value.destination
                      }
                    }
                    dynamic "s3" {
                      for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
                      content {
                        canned_acl        = s3.value.canned_acl
                        destination       = s3.value.destination
                        enable_encryption = s3.value.enable_encryption
                        encryption_type   = s3.value.encryption_type
                        endpoint          = s3.value.endpoint
                        kms_key           = s3.value.kms_key
                        region            = s3.value.region
                      }
                    }
                  }
                }
                dynamic "cluster_mount_info" {
                  for_each = job_cluster.value.new_cluster.cluster_mount_info != null ? job_cluster.value.new_cluster.cluster_mount_info : []
                  content {
                    local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
                    network_filesystem_info {
                      mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
                      server_address = cluster_mount_info.value.network_filesystem_info.server_address
                    }
                    remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
                  }
                }
                cluster_name       = job_cluster.value.new_cluster.cluster_name
                custom_tags        = job_cluster.value.new_cluster.custom_tags
                data_security_mode = job_cluster.value.new_cluster.data_security_mode
                dynamic "docker_image" {
                  for_each = job_cluster.value.new_cluster.docker_image != null ? [job_cluster.value.new_cluster.docker_image] : []
                  content {
                    dynamic "basic_auth" {
                      for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
                      content {
                        password = basic_auth.value.password
                        username = basic_auth.value.username
                      }
                    }
                    url = docker_image.value.url
                  }
                }
                driver_instance_pool_id      = job_cluster.value.new_cluster.driver_instance_pool_id
                driver_node_type_id          = job_cluster.value.new_cluster.driver_node_type_id
                enable_elastic_disk          = job_cluster.value.new_cluster.enable_elastic_disk
                enable_local_disk_encryption = job_cluster.value.new_cluster.enable_local_disk_encryption
                dynamic "gcp_attributes" {
                  for_each = job_cluster.value.new_cluster.gcp_attributes != null ? [job_cluster.value.new_cluster.gcp_attributes] : []
                  content {
                    availability              = gcp_attributes.value.availability
                    boot_disk_size            = gcp_attributes.value.boot_disk_size
                    google_service_account    = gcp_attributes.value.google_service_account
                    local_ssd_count           = gcp_attributes.value.local_ssd_count
                    use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
                    zone_id                   = gcp_attributes.value.zone_id
                  }
                }
                idempotency_token = job_cluster.value.new_cluster.idempotency_token
                dynamic "init_scripts" {
                  for_each = job_cluster.value.new_cluster.init_scripts != null ? job_cluster.value.new_cluster.init_scripts : []
                  content {
                    dynamic "abfss" {
                      for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
                      content {
                        destination = abfss.value.destination
                      }
                    }
                    dynamic "dbfs" {
                      for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
                      content {
                        destination = dbfs.value.destination
                      }
                    }
                    dynamic "file" {
                      for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
                      content {
                        destination = file.value.destination
                      }
                    }
                    dynamic "gcs" {
                      for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
                      content {
                        destination = gcs.value.destination
                      }
                    }
                    dynamic "s3" {
                      for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
                      content {
                        canned_acl        = s3.value.canned_acl
                        destination       = s3.value.destination
                        enable_encryption = s3.value.enable_encryption
                        encryption_type   = s3.value.encryption_type
                        endpoint          = s3.value.endpoint
                        kms_key           = s3.value.kms_key
                        region            = s3.value.region
                      }
                    }
                    dynamic "volumes" {
                      for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
                      content {
                        destination = volumes.value.destination
                      }
                    }
                    dynamic "workspace" {
                      for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
                      content {
                        destination = workspace.value.destination
                      }
                    }
                  }
                }
                instance_pool_id = job_cluster.value.new_cluster.instance_pool_id
                node_type_id     = job_cluster.value.new_cluster.node_type_id
                num_workers      = job_cluster.value.new_cluster.num_workers
                policy_id        = job_cluster.value.new_cluster.policy_id
                runtime_engine   = job_cluster.value.new_cluster.runtime_engine
                single_user_name = job_cluster.value.new_cluster.single_user_name
                spark_conf       = job_cluster.value.new_cluster.spark_conf
                spark_env_vars   = job_cluster.value.new_cluster.spark_env_vars
                spark_version    = job_cluster.value.new_cluster.spark_version
                ssh_public_keys  = job_cluster.value.new_cluster.ssh_public_keys
                dynamic "workload_type" {
                  for_each = job_cluster.value.new_cluster.workload_type != null ? [job_cluster.value.new_cluster.workload_type] : []
                  content {
                    clients {
                      jobs      = workload_type.value.clients.jobs
                      notebooks = workload_type.value.clients.notebooks
                    }
                  }
                }
              }
            }
          }
          dynamic "library" {
            for_each = settings.value.library != null ? settings.value.library : []
            content {
              dynamic "cran" {
                for_each = library.value.cran != null ? [library.value.cran] : []
                content {
                  package = cran.value.package
                  repo    = cran.value.repo
                }
              }
              egg = library.value.egg
              jar = library.value.jar
              dynamic "maven" {
                for_each = library.value.maven != null ? [library.value.maven] : []
                content {
                  coordinates = maven.value.coordinates
                  exclusions  = maven.value.exclusions
                  repo        = maven.value.repo
                }
              }
              dynamic "provider_config" {
                for_each = library.value.provider_config != null ? [library.value.provider_config] : []
                content {
                  workspace_id = provider_config.value.workspace_id
                }
              }
              dynamic "pypi" {
                for_each = library.value.pypi != null ? [library.value.pypi] : []
                content {
                  package = pypi.value.package
                  repo    = pypi.value.repo
                }
              }
              requirements = library.value.requirements
              whl          = library.value.whl
            }
          }
          max_concurrent_runs       = settings.value.max_concurrent_runs
          max_retries               = settings.value.max_retries
          min_retry_interval_millis = settings.value.min_retry_interval_millis
          name                      = settings.value.name
          dynamic "new_cluster" {
            for_each = settings.value.new_cluster != null ? [settings.value.new_cluster] : []
            content {
              apply_policy_default_values = new_cluster.value.apply_policy_default_values
              dynamic "autoscale" {
                for_each = new_cluster.value.autoscale != null ? [new_cluster.value.autoscale] : []
                content {
                  max_workers = autoscale.value.max_workers
                  min_workers = autoscale.value.min_workers
                }
              }
              autotermination_minutes = new_cluster.value.autotermination_minutes
              dynamic "aws_attributes" {
                for_each = new_cluster.value.aws_attributes != null ? [new_cluster.value.aws_attributes] : []
                content {
                  availability           = aws_attributes.value.availability
                  ebs_volume_count       = aws_attributes.value.ebs_volume_count
                  ebs_volume_size        = aws_attributes.value.ebs_volume_size
                  ebs_volume_type        = aws_attributes.value.ebs_volume_type
                  first_on_demand        = aws_attributes.value.first_on_demand
                  instance_profile_arn   = aws_attributes.value.instance_profile_arn
                  spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
                  zone_id                = aws_attributes.value.zone_id
                }
              }
              dynamic "azure_attributes" {
                for_each = new_cluster.value.azure_attributes != null ? [new_cluster.value.azure_attributes] : []
                content {
                  availability       = azure_attributes.value.availability
                  first_on_demand    = azure_attributes.value.first_on_demand
                  spot_bid_max_price = azure_attributes.value.spot_bid_max_price
                }
              }
              cluster_id = new_cluster.value.cluster_id
              dynamic "cluster_log_conf" {
                for_each = new_cluster.value.cluster_log_conf != null ? [new_cluster.value.cluster_log_conf] : []
                content {
                  dynamic "dbfs" {
                    for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
                    content {
                      destination = dbfs.value.destination
                    }
                  }
                  dynamic "s3" {
                    for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
                    content {
                      canned_acl        = s3.value.canned_acl
                      destination       = s3.value.destination
                      enable_encryption = s3.value.enable_encryption
                      encryption_type   = s3.value.encryption_type
                      endpoint          = s3.value.endpoint
                      kms_key           = s3.value.kms_key
                      region            = s3.value.region
                    }
                  }
                }
              }
              dynamic "cluster_mount_info" {
                for_each = new_cluster.value.cluster_mount_info != null ? new_cluster.value.cluster_mount_info : []
                content {
                  local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
                  network_filesystem_info {
                    mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
                    server_address = cluster_mount_info.value.network_filesystem_info.server_address
                  }
                  remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
                }
              }
              cluster_name       = new_cluster.value.cluster_name
              custom_tags        = new_cluster.value.custom_tags
              data_security_mode = new_cluster.value.data_security_mode
              dynamic "docker_image" {
                for_each = new_cluster.value.docker_image != null ? [new_cluster.value.docker_image] : []
                content {
                  dynamic "basic_auth" {
                    for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
                    content {
                      password = basic_auth.value.password
                      username = basic_auth.value.username
                    }
                  }
                  url = docker_image.value.url
                }
              }
              driver_instance_pool_id      = new_cluster.value.driver_instance_pool_id
              driver_node_type_id          = new_cluster.value.driver_node_type_id
              enable_elastic_disk          = new_cluster.value.enable_elastic_disk
              enable_local_disk_encryption = new_cluster.value.enable_local_disk_encryption
              dynamic "gcp_attributes" {
                for_each = new_cluster.value.gcp_attributes != null ? [new_cluster.value.gcp_attributes] : []
                content {
                  availability              = gcp_attributes.value.availability
                  boot_disk_size            = gcp_attributes.value.boot_disk_size
                  google_service_account    = gcp_attributes.value.google_service_account
                  local_ssd_count           = gcp_attributes.value.local_ssd_count
                  use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
                  zone_id                   = gcp_attributes.value.zone_id
                }
              }
              idempotency_token = new_cluster.value.idempotency_token
              dynamic "init_scripts" {
                for_each = new_cluster.value.init_scripts != null ? new_cluster.value.init_scripts : []
                content {
                  dynamic "abfss" {
                    for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
                    content {
                      destination = abfss.value.destination
                    }
                  }
                  dynamic "dbfs" {
                    for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
                    content {
                      destination = dbfs.value.destination
                    }
                  }
                  dynamic "file" {
                    for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
                    content {
                      destination = file.value.destination
                    }
                  }
                  dynamic "gcs" {
                    for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
                    content {
                      destination = gcs.value.destination
                    }
                  }
                  dynamic "s3" {
                    for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
                    content {
                      canned_acl        = s3.value.canned_acl
                      destination       = s3.value.destination
                      enable_encryption = s3.value.enable_encryption
                      encryption_type   = s3.value.encryption_type
                      endpoint          = s3.value.endpoint
                      kms_key           = s3.value.kms_key
                      region            = s3.value.region
                    }
                  }
                  dynamic "volumes" {
                    for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
                    content {
                      destination = volumes.value.destination
                    }
                  }
                  dynamic "workspace" {
                    for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
                    content {
                      destination = workspace.value.destination
                    }
                  }
                }
              }
              instance_pool_id = new_cluster.value.instance_pool_id
              node_type_id     = new_cluster.value.node_type_id
              num_workers      = new_cluster.value.num_workers
              policy_id        = new_cluster.value.policy_id
              runtime_engine   = new_cluster.value.runtime_engine
              single_user_name = new_cluster.value.single_user_name
              spark_conf       = new_cluster.value.spark_conf
              spark_env_vars   = new_cluster.value.spark_env_vars
              spark_version    = new_cluster.value.spark_version
              ssh_public_keys  = new_cluster.value.ssh_public_keys
              dynamic "workload_type" {
                for_each = new_cluster.value.workload_type != null ? [new_cluster.value.workload_type] : []
                content {
                  clients {
                    jobs      = workload_type.value.clients.jobs
                    notebooks = workload_type.value.clients.notebooks
                  }
                }
              }
            }
          }
          dynamic "notebook_task" {
            for_each = settings.value.notebook_task != null ? [settings.value.notebook_task] : []
            content {
              base_parameters = notebook_task.value.base_parameters
              notebook_path   = notebook_task.value.notebook_path
              source          = notebook_task.value.source
              warehouse_id    = notebook_task.value.warehouse_id
            }
          }
          dynamic "notification_settings" {
            for_each = settings.value.notification_settings != null ? [settings.value.notification_settings] : []
            content {
              no_alert_for_canceled_runs = notification_settings.value.no_alert_for_canceled_runs
              no_alert_for_skipped_runs  = notification_settings.value.no_alert_for_skipped_runs
            }
          }
          dynamic "parameter" {
            for_each = settings.value.parameter != null ? settings.value.parameter : []
            content {
              default = parameter.value.default
              name    = parameter.value.name
            }
          }
          dynamic "pipeline_task" {
            for_each = settings.value.pipeline_task != null ? [settings.value.pipeline_task] : []
            content {
              full_refresh = pipeline_task.value.full_refresh
              pipeline_id  = pipeline_task.value.pipeline_id
            }
          }
          dynamic "python_wheel_task" {
            for_each = settings.value.python_wheel_task != null ? [settings.value.python_wheel_task] : []
            content {
              entry_point      = python_wheel_task.value.entry_point
              named_parameters = python_wheel_task.value.named_parameters
              package_name     = python_wheel_task.value.package_name
              parameters       = python_wheel_task.value.parameters
            }
          }
          dynamic "queue" {
            for_each = settings.value.queue != null ? [settings.value.queue] : []
            content {
              enabled = queue.value.enabled
            }
          }
          retry_on_timeout = settings.value.retry_on_timeout
          dynamic "run_as" {
            for_each = settings.value.run_as != null ? [settings.value.run_as] : []
            content {
              service_principal_name = run_as.value.service_principal_name
              user_name              = run_as.value.user_name
            }
          }
          dynamic "run_job_task" {
            for_each = settings.value.run_job_task != null ? [settings.value.run_job_task] : []
            content {
              job_id         = run_job_task.value.job_id
              job_parameters = run_job_task.value.job_parameters
            }
          }
          dynamic "schedule" {
            for_each = settings.value.schedule != null ? [settings.value.schedule] : []
            content {
              pause_status           = schedule.value.pause_status
              quartz_cron_expression = schedule.value.quartz_cron_expression
              timezone_id            = schedule.value.timezone_id
            }
          }
          dynamic "spark_jar_task" {
            for_each = settings.value.spark_jar_task != null ? [settings.value.spark_jar_task] : []
            content {
              jar_uri         = spark_jar_task.value.jar_uri
              main_class_name = spark_jar_task.value.main_class_name
              parameters      = spark_jar_task.value.parameters
            }
          }
          dynamic "spark_python_task" {
            for_each = settings.value.spark_python_task != null ? [settings.value.spark_python_task] : []
            content {
              parameters  = spark_python_task.value.parameters
              python_file = spark_python_task.value.python_file
              source      = spark_python_task.value.source
            }
          }
          dynamic "spark_submit_task" {
            for_each = settings.value.spark_submit_task != null ? [settings.value.spark_submit_task] : []
            content {
              parameters = spark_submit_task.value.parameters
            }
          }
          tags = settings.value.tags
          dynamic "task" {
            for_each = settings.value.task != null ? settings.value.task : []
            content {
              dynamic "condition_task" {
                for_each = task.value.condition_task != null ? [task.value.condition_task] : []
                content {
                  left  = condition_task.value.left
                  op    = condition_task.value.op
                  right = condition_task.value.right
                }
              }
              dynamic "dashboard_task" {
                for_each = task.value.dashboard_task != null ? [task.value.dashboard_task] : []
                content {
                  dashboard_id = dashboard_task.value.dashboard_id
                  filters      = dashboard_task.value.filters
                  dynamic "subscription" {
                    for_each = dashboard_task.value.subscription != null ? [dashboard_task.value.subscription] : []
                    content {
                      custom_subject = subscription.value.custom_subject
                      paused         = subscription.value.paused
                      dynamic "subscribers" {
                        for_each = subscription.value.subscribers != null ? subscription.value.subscribers : []
                        content {
                          destination_id = subscribers.value.destination_id
                          user_name      = subscribers.value.user_name
                        }
                      }
                    }
                  }
                  warehouse_id = dashboard_task.value.warehouse_id
                }
              }
              dynamic "dbt_task" {
                for_each = task.value.dbt_task != null ? [task.value.dbt_task] : []
                content {
                  catalog            = dbt_task.value.catalog
                  commands           = dbt_task.value.commands
                  profiles_directory = dbt_task.value.profiles_directory
                  project_directory  = dbt_task.value.project_directory
                  schema             = dbt_task.value.schema
                  source             = dbt_task.value.source
                  warehouse_id       = dbt_task.value.warehouse_id
                }
              }
              dynamic "depends_on" {
                for_each = task.value.depends_on != null ? task.value.depends_on : []
                content {
                  outcome  = depends_on.value.outcome
                  task_key = depends_on.value.task_key
                }
              }
              description = task.value.description
              dynamic "email_notifications" {
                for_each = task.value.email_notifications != null ? [task.value.email_notifications] : []
                content {
                  no_alert_for_skipped_runs              = email_notifications.value.no_alert_for_skipped_runs
                  on_duration_warning_threshold_exceeded = email_notifications.value.on_duration_warning_threshold_exceeded
                  on_failure                             = email_notifications.value.on_failure
                  on_maintenance_complete                = email_notifications.value.on_maintenance_complete
                  on_maintenance_start                   = email_notifications.value.on_maintenance_start
                  on_start                               = email_notifications.value.on_start
                  on_streaming_backlog_exceeded          = email_notifications.value.on_streaming_backlog_exceeded
                  on_success                             = email_notifications.value.on_success
                }
              }
              environment_key     = task.value.environment_key
              existing_cluster_id = task.value.existing_cluster_id
              dynamic "for_each_task" {
                for_each = task.value.for_each_task != null ? [task.value.for_each_task] : []
                content {
                  concurrency = for_each_task.value.concurrency
                  inputs      = for_each_task.value.inputs
                  task {
                    dynamic "condition_task" {
                      for_each = for_each_task.value.task.condition_task != null ? [for_each_task.value.task.condition_task] : []
                      content {
                        left  = condition_task.value.left
                        op    = condition_task.value.op
                        right = condition_task.value.right
                      }
                    }
                    dynamic "dashboard_task" {
                      for_each = for_each_task.value.task.dashboard_task != null ? [for_each_task.value.task.dashboard_task] : []
                      content {
                        dashboard_id = dashboard_task.value.dashboard_id
                        filters      = dashboard_task.value.filters
                        dynamic "subscription" {
                          for_each = dashboard_task.value.subscription != null ? [dashboard_task.value.subscription] : []
                          content {
                            custom_subject = subscription.value.custom_subject
                            paused         = subscription.value.paused
                            dynamic "subscribers" {
                              for_each = subscription.value.subscribers != null ? subscription.value.subscribers : []
                              content {
                                destination_id = subscribers.value.destination_id
                                user_name      = subscribers.value.user_name
                              }
                            }
                          }
                        }
                        warehouse_id = dashboard_task.value.warehouse_id
                      }
                    }
                    dynamic "dbt_task" {
                      for_each = for_each_task.value.task.dbt_task != null ? [for_each_task.value.task.dbt_task] : []
                      content {
                        catalog            = dbt_task.value.catalog
                        commands           = dbt_task.value.commands
                        profiles_directory = dbt_task.value.profiles_directory
                        project_directory  = dbt_task.value.project_directory
                        schema             = dbt_task.value.schema
                        source             = dbt_task.value.source
                        warehouse_id       = dbt_task.value.warehouse_id
                      }
                    }
                    dynamic "depends_on" {
                      for_each = for_each_task.value.task.depends_on != null ? for_each_task.value.task.depends_on : []
                      content {
                        outcome  = depends_on.value.outcome
                        task_key = depends_on.value.task_key
                      }
                    }
                    description = for_each_task.value.task.description
                    dynamic "email_notifications" {
                      for_each = for_each_task.value.task.email_notifications != null ? [for_each_task.value.task.email_notifications] : []
                      content {
                        no_alert_for_skipped_runs              = email_notifications.value.no_alert_for_skipped_runs
                        on_duration_warning_threshold_exceeded = email_notifications.value.on_duration_warning_threshold_exceeded
                        on_failure                             = email_notifications.value.on_failure
                        on_maintenance_complete                = email_notifications.value.on_maintenance_complete
                        on_maintenance_start                   = email_notifications.value.on_maintenance_start
                        on_start                               = email_notifications.value.on_start
                        on_streaming_backlog_exceeded          = email_notifications.value.on_streaming_backlog_exceeded
                        on_success                             = email_notifications.value.on_success
                      }
                    }
                    environment_key     = for_each_task.value.task.environment_key
                    existing_cluster_id = for_each_task.value.task.existing_cluster_id
                    dynamic "health" {
                      for_each = for_each_task.value.task.health != null ? [for_each_task.value.task.health] : []
                      content {
                        dynamic "rules" {
                          for_each = health.value.rules
                          content {
                            metric = rules.value.metric
                            op     = rules.value.op
                            value  = rules.value.value
                          }
                        }
                      }
                    }
                    job_cluster_key = for_each_task.value.task.job_cluster_key
                    dynamic "library" {
                      for_each = for_each_task.value.task.library != null ? for_each_task.value.task.library : []
                      content {
                        dynamic "cran" {
                          for_each = library.value.cran != null ? [library.value.cran] : []
                          content {
                            package = cran.value.package
                            repo    = cran.value.repo
                          }
                        }
                        egg = library.value.egg
                        jar = library.value.jar
                        dynamic "maven" {
                          for_each = library.value.maven != null ? [library.value.maven] : []
                          content {
                            coordinates = maven.value.coordinates
                            exclusions  = maven.value.exclusions
                            repo        = maven.value.repo
                          }
                        }
                        dynamic "provider_config" {
                          for_each = library.value.provider_config != null ? [library.value.provider_config] : []
                          content {
                            workspace_id = provider_config.value.workspace_id
                          }
                        }
                        dynamic "pypi" {
                          for_each = library.value.pypi != null ? [library.value.pypi] : []
                          content {
                            package = pypi.value.package
                            repo    = pypi.value.repo
                          }
                        }
                        requirements = library.value.requirements
                        whl          = library.value.whl
                      }
                    }
                    max_retries               = for_each_task.value.task.max_retries
                    min_retry_interval_millis = for_each_task.value.task.min_retry_interval_millis
                    dynamic "new_cluster" {
                      for_each = for_each_task.value.task.new_cluster != null ? [for_each_task.value.task.new_cluster] : []
                      content {
                        apply_policy_default_values = new_cluster.value.apply_policy_default_values
                        dynamic "autoscale" {
                          for_each = new_cluster.value.autoscale != null ? [new_cluster.value.autoscale] : []
                          content {
                            max_workers = autoscale.value.max_workers
                            min_workers = autoscale.value.min_workers
                          }
                        }
                        autotermination_minutes = new_cluster.value.autotermination_minutes
                        dynamic "aws_attributes" {
                          for_each = new_cluster.value.aws_attributes != null ? [new_cluster.value.aws_attributes] : []
                          content {
                            availability           = aws_attributes.value.availability
                            ebs_volume_count       = aws_attributes.value.ebs_volume_count
                            ebs_volume_size        = aws_attributes.value.ebs_volume_size
                            ebs_volume_type        = aws_attributes.value.ebs_volume_type
                            first_on_demand        = aws_attributes.value.first_on_demand
                            instance_profile_arn   = aws_attributes.value.instance_profile_arn
                            spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
                            zone_id                = aws_attributes.value.zone_id
                          }
                        }
                        dynamic "azure_attributes" {
                          for_each = new_cluster.value.azure_attributes != null ? [new_cluster.value.azure_attributes] : []
                          content {
                            availability       = azure_attributes.value.availability
                            first_on_demand    = azure_attributes.value.first_on_demand
                            spot_bid_max_price = azure_attributes.value.spot_bid_max_price
                          }
                        }
                        cluster_id = new_cluster.value.cluster_id
                        dynamic "cluster_log_conf" {
                          for_each = new_cluster.value.cluster_log_conf != null ? [new_cluster.value.cluster_log_conf] : []
                          content {
                            dynamic "dbfs" {
                              for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
                              content {
                                destination = dbfs.value.destination
                              }
                            }
                            dynamic "s3" {
                              for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
                              content {
                                canned_acl        = s3.value.canned_acl
                                destination       = s3.value.destination
                                enable_encryption = s3.value.enable_encryption
                                encryption_type   = s3.value.encryption_type
                                endpoint          = s3.value.endpoint
                                kms_key           = s3.value.kms_key
                                region            = s3.value.region
                              }
                            }
                          }
                        }
                        dynamic "cluster_mount_info" {
                          for_each = new_cluster.value.cluster_mount_info != null ? new_cluster.value.cluster_mount_info : []
                          content {
                            local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
                            network_filesystem_info {
                              mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
                              server_address = cluster_mount_info.value.network_filesystem_info.server_address
                            }
                            remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
                          }
                        }
                        cluster_name       = new_cluster.value.cluster_name
                        custom_tags        = new_cluster.value.custom_tags
                        data_security_mode = new_cluster.value.data_security_mode
                        dynamic "docker_image" {
                          for_each = new_cluster.value.docker_image != null ? [new_cluster.value.docker_image] : []
                          content {
                            dynamic "basic_auth" {
                              for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
                              content {
                                password = basic_auth.value.password
                                username = basic_auth.value.username
                              }
                            }
                            url = docker_image.value.url
                          }
                        }
                        driver_instance_pool_id      = new_cluster.value.driver_instance_pool_id
                        driver_node_type_id          = new_cluster.value.driver_node_type_id
                        enable_elastic_disk          = new_cluster.value.enable_elastic_disk
                        enable_local_disk_encryption = new_cluster.value.enable_local_disk_encryption
                        dynamic "gcp_attributes" {
                          for_each = new_cluster.value.gcp_attributes != null ? [new_cluster.value.gcp_attributes] : []
                          content {
                            availability              = gcp_attributes.value.availability
                            boot_disk_size            = gcp_attributes.value.boot_disk_size
                            google_service_account    = gcp_attributes.value.google_service_account
                            local_ssd_count           = gcp_attributes.value.local_ssd_count
                            use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
                            zone_id                   = gcp_attributes.value.zone_id
                          }
                        }
                        idempotency_token = new_cluster.value.idempotency_token
                        dynamic "init_scripts" {
                          for_each = new_cluster.value.init_scripts != null ? new_cluster.value.init_scripts : []
                          content {
                            dynamic "abfss" {
                              for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
                              content {
                                destination = abfss.value.destination
                              }
                            }
                            dynamic "dbfs" {
                              for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
                              content {
                                destination = dbfs.value.destination
                              }
                            }
                            dynamic "file" {
                              for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
                              content {
                                destination = file.value.destination
                              }
                            }
                            dynamic "gcs" {
                              for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
                              content {
                                destination = gcs.value.destination
                              }
                            }
                            dynamic "s3" {
                              for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
                              content {
                                canned_acl        = s3.value.canned_acl
                                destination       = s3.value.destination
                                enable_encryption = s3.value.enable_encryption
                                encryption_type   = s3.value.encryption_type
                                endpoint          = s3.value.endpoint
                                kms_key           = s3.value.kms_key
                                region            = s3.value.region
                              }
                            }
                            dynamic "volumes" {
                              for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
                              content {
                                destination = volumes.value.destination
                              }
                            }
                            dynamic "workspace" {
                              for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
                              content {
                                destination = workspace.value.destination
                              }
                            }
                          }
                        }
                        instance_pool_id = new_cluster.value.instance_pool_id
                        node_type_id     = new_cluster.value.node_type_id
                        num_workers      = new_cluster.value.num_workers
                        policy_id        = new_cluster.value.policy_id
                        runtime_engine   = new_cluster.value.runtime_engine
                        single_user_name = new_cluster.value.single_user_name
                        spark_conf       = new_cluster.value.spark_conf
                        spark_env_vars   = new_cluster.value.spark_env_vars
                        spark_version    = new_cluster.value.spark_version
                        ssh_public_keys  = new_cluster.value.ssh_public_keys
                        dynamic "workload_type" {
                          for_each = new_cluster.value.workload_type != null ? [new_cluster.value.workload_type] : []
                          content {
                            clients {
                              jobs      = workload_type.value.clients.jobs
                              notebooks = workload_type.value.clients.notebooks
                            }
                          }
                        }
                      }
                    }
                    dynamic "notebook_task" {
                      for_each = for_each_task.value.task.notebook_task != null ? [for_each_task.value.task.notebook_task] : []
                      content {
                        base_parameters = notebook_task.value.base_parameters
                        notebook_path   = notebook_task.value.notebook_path
                        source          = notebook_task.value.source
                        warehouse_id    = notebook_task.value.warehouse_id
                      }
                    }
                    dynamic "notification_settings" {
                      for_each = for_each_task.value.task.notification_settings != null ? [for_each_task.value.task.notification_settings] : []
                      content {
                        alert_on_last_attempt      = notification_settings.value.alert_on_last_attempt
                        no_alert_for_canceled_runs = notification_settings.value.no_alert_for_canceled_runs
                        no_alert_for_skipped_runs  = notification_settings.value.no_alert_for_skipped_runs
                      }
                    }
                    dynamic "pipeline_task" {
                      for_each = for_each_task.value.task.pipeline_task != null ? [for_each_task.value.task.pipeline_task] : []
                      content {
                        full_refresh = pipeline_task.value.full_refresh
                        pipeline_id  = pipeline_task.value.pipeline_id
                      }
                    }
                    dynamic "power_bi_task" {
                      for_each = for_each_task.value.task.power_bi_task != null ? [for_each_task.value.task.power_bi_task] : []
                      content {
                        connection_resource_name = power_bi_task.value.connection_resource_name
                        dynamic "power_bi_model" {
                          for_each = power_bi_task.value.power_bi_model != null ? [power_bi_task.value.power_bi_model] : []
                          content {
                            authentication_method = power_bi_model.value.authentication_method
                            model_name            = power_bi_model.value.model_name
                            overwrite_existing    = power_bi_model.value.overwrite_existing
                            storage_mode          = power_bi_model.value.storage_mode
                            workspace_name        = power_bi_model.value.workspace_name
                          }
                        }
                        refresh_after_update = power_bi_task.value.refresh_after_update
                        dynamic "tables" {
                          for_each = power_bi_task.value.tables != null ? power_bi_task.value.tables : []
                          content {
                            catalog      = tables.value.catalog
                            name         = tables.value.name
                            schema       = tables.value.schema
                            storage_mode = tables.value.storage_mode
                          }
                        }
                        warehouse_id = power_bi_task.value.warehouse_id
                      }
                    }
                    dynamic "python_wheel_task" {
                      for_each = for_each_task.value.task.python_wheel_task != null ? [for_each_task.value.task.python_wheel_task] : []
                      content {
                        entry_point      = python_wheel_task.value.entry_point
                        named_parameters = python_wheel_task.value.named_parameters
                        package_name     = python_wheel_task.value.package_name
                        parameters       = python_wheel_task.value.parameters
                      }
                    }
                    retry_on_timeout = for_each_task.value.task.retry_on_timeout
                    run_if           = for_each_task.value.task.run_if
                    dynamic "run_job_task" {
                      for_each = for_each_task.value.task.run_job_task != null ? [for_each_task.value.task.run_job_task] : []
                      content {
                        job_id         = run_job_task.value.job_id
                        job_parameters = run_job_task.value.job_parameters
                      }
                    }
                    dynamic "spark_jar_task" {
                      for_each = for_each_task.value.task.spark_jar_task != null ? [for_each_task.value.task.spark_jar_task] : []
                      content {
                        jar_uri         = spark_jar_task.value.jar_uri
                        main_class_name = spark_jar_task.value.main_class_name
                        parameters      = spark_jar_task.value.parameters
                      }
                    }
                    dynamic "spark_python_task" {
                      for_each = for_each_task.value.task.spark_python_task != null ? [for_each_task.value.task.spark_python_task] : []
                      content {
                        parameters  = spark_python_task.value.parameters
                        python_file = spark_python_task.value.python_file
                        source      = spark_python_task.value.source
                      }
                    }
                    dynamic "spark_submit_task" {
                      for_each = for_each_task.value.task.spark_submit_task != null ? [for_each_task.value.task.spark_submit_task] : []
                      content {
                        parameters = spark_submit_task.value.parameters
                      }
                    }
                    dynamic "sql_task" {
                      for_each = for_each_task.value.task.sql_task != null ? [for_each_task.value.task.sql_task] : []
                      content {
                        dynamic "alert" {
                          for_each = sql_task.value.alert != null ? [sql_task.value.alert] : []
                          content {
                            alert_id            = alert.value.alert_id
                            pause_subscriptions = alert.value.pause_subscriptions
                            dynamic "subscriptions" {
                              for_each = alert.value.subscriptions != null ? alert.value.subscriptions : []
                              content {
                                destination_id = subscriptions.value.destination_id
                                user_name      = subscriptions.value.user_name
                              }
                            }
                          }
                        }
                        dynamic "dashboard" {
                          for_each = sql_task.value.dashboard != null ? [sql_task.value.dashboard] : []
                          content {
                            custom_subject      = dashboard.value.custom_subject
                            dashboard_id        = dashboard.value.dashboard_id
                            pause_subscriptions = dashboard.value.pause_subscriptions
                            dynamic "subscriptions" {
                              for_each = dashboard.value.subscriptions != null ? dashboard.value.subscriptions : []
                              content {
                                destination_id = subscriptions.value.destination_id
                                user_name      = subscriptions.value.user_name
                              }
                            }
                          }
                        }
                        dynamic "file" {
                          for_each = sql_task.value.file != null ? [sql_task.value.file] : []
                          content {
                            path   = file.value.path
                            source = file.value.source
                          }
                        }
                        parameters = sql_task.value.parameters
                        dynamic "query" {
                          for_each = sql_task.value.query != null ? [sql_task.value.query] : []
                          content {
                            query_id = query.value.query_id
                          }
                        }
                        warehouse_id = sql_task.value.warehouse_id
                      }
                    }
                    task_key        = for_each_task.value.task.task_key
                    timeout_seconds = for_each_task.value.task.timeout_seconds
                    dynamic "webhook_notifications" {
                      for_each = for_each_task.value.task.webhook_notifications != null ? [for_each_task.value.task.webhook_notifications] : []
                      content {
                        dynamic "on_duration_warning_threshold_exceeded" {
                          for_each = webhook_notifications.value.on_duration_warning_threshold_exceeded != null ? webhook_notifications.value.on_duration_warning_threshold_exceeded : []
                          content {
                            id = on_duration_warning_threshold_exceeded.value.id
                          }
                        }
                        dynamic "on_failure" {
                          for_each = webhook_notifications.value.on_failure != null ? webhook_notifications.value.on_failure : []
                          content {
                            id = on_failure.value.id
                          }
                        }
                        dynamic "on_maintenance_complete" {
                          for_each = webhook_notifications.value.on_maintenance_complete != null ? webhook_notifications.value.on_maintenance_complete : []
                          content {
                            id = on_maintenance_complete.value.id
                          }
                        }
                        dynamic "on_maintenance_start" {
                          for_each = webhook_notifications.value.on_maintenance_start != null ? webhook_notifications.value.on_maintenance_start : []
                          content {
                            id = on_maintenance_start.value.id
                          }
                        }
                        dynamic "on_start" {
                          for_each = webhook_notifications.value.on_start != null ? webhook_notifications.value.on_start : []
                          content {
                            id = on_start.value.id
                          }
                        }
                        dynamic "on_streaming_backlog_exceeded" {
                          for_each = webhook_notifications.value.on_streaming_backlog_exceeded != null ? webhook_notifications.value.on_streaming_backlog_exceeded : []
                          content {
                            id = on_streaming_backlog_exceeded.value.id
                          }
                        }
                        dynamic "on_success" {
                          for_each = webhook_notifications.value.on_success != null ? webhook_notifications.value.on_success : []
                          content {
                            id = on_success.value.id
                          }
                        }
                      }
                    }
                  }
                }
              }
              dynamic "health" {
                for_each = task.value.health != null ? [task.value.health] : []
                content {
                  dynamic "rules" {
                    for_each = health.value.rules
                    content {
                      metric = rules.value.metric
                      op     = rules.value.op
                      value  = rules.value.value
                    }
                  }
                }
              }
              job_cluster_key = task.value.job_cluster_key
              dynamic "library" {
                for_each = task.value.library != null ? task.value.library : []
                content {
                  dynamic "cran" {
                    for_each = library.value.cran != null ? [library.value.cran] : []
                    content {
                      package = cran.value.package
                      repo    = cran.value.repo
                    }
                  }
                  egg = library.value.egg
                  jar = library.value.jar
                  dynamic "maven" {
                    for_each = library.value.maven != null ? [library.value.maven] : []
                    content {
                      coordinates = maven.value.coordinates
                      exclusions  = maven.value.exclusions
                      repo        = maven.value.repo
                    }
                  }
                  dynamic "provider_config" {
                    for_each = library.value.provider_config != null ? [library.value.provider_config] : []
                    content {
                      workspace_id = provider_config.value.workspace_id
                    }
                  }
                  dynamic "pypi" {
                    for_each = library.value.pypi != null ? [library.value.pypi] : []
                    content {
                      package = pypi.value.package
                      repo    = pypi.value.repo
                    }
                  }
                  requirements = library.value.requirements
                  whl          = library.value.whl
                }
              }
              max_retries               = task.value.max_retries
              min_retry_interval_millis = task.value.min_retry_interval_millis
              dynamic "new_cluster" {
                for_each = task.value.new_cluster != null ? [task.value.new_cluster] : []
                content {
                  apply_policy_default_values = new_cluster.value.apply_policy_default_values
                  dynamic "autoscale" {
                    for_each = new_cluster.value.autoscale != null ? [new_cluster.value.autoscale] : []
                    content {
                      max_workers = autoscale.value.max_workers
                      min_workers = autoscale.value.min_workers
                    }
                  }
                  autotermination_minutes = new_cluster.value.autotermination_minutes
                  dynamic "aws_attributes" {
                    for_each = new_cluster.value.aws_attributes != null ? [new_cluster.value.aws_attributes] : []
                    content {
                      availability           = aws_attributes.value.availability
                      ebs_volume_count       = aws_attributes.value.ebs_volume_count
                      ebs_volume_size        = aws_attributes.value.ebs_volume_size
                      ebs_volume_type        = aws_attributes.value.ebs_volume_type
                      first_on_demand        = aws_attributes.value.first_on_demand
                      instance_profile_arn   = aws_attributes.value.instance_profile_arn
                      spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
                      zone_id                = aws_attributes.value.zone_id
                    }
                  }
                  dynamic "azure_attributes" {
                    for_each = new_cluster.value.azure_attributes != null ? [new_cluster.value.azure_attributes] : []
                    content {
                      availability       = azure_attributes.value.availability
                      first_on_demand    = azure_attributes.value.first_on_demand
                      spot_bid_max_price = azure_attributes.value.spot_bid_max_price
                    }
                  }
                  cluster_id = new_cluster.value.cluster_id
                  dynamic "cluster_log_conf" {
                    for_each = new_cluster.value.cluster_log_conf != null ? [new_cluster.value.cluster_log_conf] : []
                    content {
                      dynamic "dbfs" {
                        for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
                        content {
                          destination = dbfs.value.destination
                        }
                      }
                      dynamic "s3" {
                        for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
                        content {
                          canned_acl        = s3.value.canned_acl
                          destination       = s3.value.destination
                          enable_encryption = s3.value.enable_encryption
                          encryption_type   = s3.value.encryption_type
                          endpoint          = s3.value.endpoint
                          kms_key           = s3.value.kms_key
                          region            = s3.value.region
                        }
                      }
                    }
                  }
                  dynamic "cluster_mount_info" {
                    for_each = new_cluster.value.cluster_mount_info != null ? new_cluster.value.cluster_mount_info : []
                    content {
                      local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
                      network_filesystem_info {
                        mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
                        server_address = cluster_mount_info.value.network_filesystem_info.server_address
                      }
                      remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
                    }
                  }
                  cluster_name       = new_cluster.value.cluster_name
                  custom_tags        = new_cluster.value.custom_tags
                  data_security_mode = new_cluster.value.data_security_mode
                  dynamic "docker_image" {
                    for_each = new_cluster.value.docker_image != null ? [new_cluster.value.docker_image] : []
                    content {
                      dynamic "basic_auth" {
                        for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
                        content {
                          password = basic_auth.value.password
                          username = basic_auth.value.username
                        }
                      }
                      url = docker_image.value.url
                    }
                  }
                  driver_instance_pool_id      = new_cluster.value.driver_instance_pool_id
                  driver_node_type_id          = new_cluster.value.driver_node_type_id
                  enable_elastic_disk          = new_cluster.value.enable_elastic_disk
                  enable_local_disk_encryption = new_cluster.value.enable_local_disk_encryption
                  dynamic "gcp_attributes" {
                    for_each = new_cluster.value.gcp_attributes != null ? [new_cluster.value.gcp_attributes] : []
                    content {
                      availability              = gcp_attributes.value.availability
                      boot_disk_size            = gcp_attributes.value.boot_disk_size
                      google_service_account    = gcp_attributes.value.google_service_account
                      local_ssd_count           = gcp_attributes.value.local_ssd_count
                      use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
                      zone_id                   = gcp_attributes.value.zone_id
                    }
                  }
                  idempotency_token = new_cluster.value.idempotency_token
                  dynamic "init_scripts" {
                    for_each = new_cluster.value.init_scripts != null ? new_cluster.value.init_scripts : []
                    content {
                      dynamic "abfss" {
                        for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
                        content {
                          destination = abfss.value.destination
                        }
                      }
                      dynamic "dbfs" {
                        for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
                        content {
                          destination = dbfs.value.destination
                        }
                      }
                      dynamic "file" {
                        for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
                        content {
                          destination = file.value.destination
                        }
                      }
                      dynamic "gcs" {
                        for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
                        content {
                          destination = gcs.value.destination
                        }
                      }
                      dynamic "s3" {
                        for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
                        content {
                          canned_acl        = s3.value.canned_acl
                          destination       = s3.value.destination
                          enable_encryption = s3.value.enable_encryption
                          encryption_type   = s3.value.encryption_type
                          endpoint          = s3.value.endpoint
                          kms_key           = s3.value.kms_key
                          region            = s3.value.region
                        }
                      }
                      dynamic "volumes" {
                        for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
                        content {
                          destination = volumes.value.destination
                        }
                      }
                      dynamic "workspace" {
                        for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
                        content {
                          destination = workspace.value.destination
                        }
                      }
                    }
                  }
                  instance_pool_id = new_cluster.value.instance_pool_id
                  node_type_id     = new_cluster.value.node_type_id
                  num_workers      = new_cluster.value.num_workers
                  policy_id        = new_cluster.value.policy_id
                  runtime_engine   = new_cluster.value.runtime_engine
                  single_user_name = new_cluster.value.single_user_name
                  spark_conf       = new_cluster.value.spark_conf
                  spark_env_vars   = new_cluster.value.spark_env_vars
                  spark_version    = new_cluster.value.spark_version
                  ssh_public_keys  = new_cluster.value.ssh_public_keys
                  dynamic "workload_type" {
                    for_each = new_cluster.value.workload_type != null ? [new_cluster.value.workload_type] : []
                    content {
                      clients {
                        jobs      = workload_type.value.clients.jobs
                        notebooks = workload_type.value.clients.notebooks
                      }
                    }
                  }
                }
              }
              dynamic "notebook_task" {
                for_each = task.value.notebook_task != null ? [task.value.notebook_task] : []
                content {
                  base_parameters = notebook_task.value.base_parameters
                  notebook_path   = notebook_task.value.notebook_path
                  source          = notebook_task.value.source
                  warehouse_id    = notebook_task.value.warehouse_id
                }
              }
              dynamic "notification_settings" {
                for_each = task.value.notification_settings != null ? [task.value.notification_settings] : []
                content {
                  alert_on_last_attempt      = notification_settings.value.alert_on_last_attempt
                  no_alert_for_canceled_runs = notification_settings.value.no_alert_for_canceled_runs
                  no_alert_for_skipped_runs  = notification_settings.value.no_alert_for_skipped_runs
                }
              }
              dynamic "pipeline_task" {
                for_each = task.value.pipeline_task != null ? [task.value.pipeline_task] : []
                content {
                  full_refresh = pipeline_task.value.full_refresh
                  pipeline_id  = pipeline_task.value.pipeline_id
                }
              }
              dynamic "power_bi_task" {
                for_each = task.value.power_bi_task != null ? [task.value.power_bi_task] : []
                content {
                  connection_resource_name = power_bi_task.value.connection_resource_name
                  dynamic "power_bi_model" {
                    for_each = power_bi_task.value.power_bi_model != null ? [power_bi_task.value.power_bi_model] : []
                    content {
                      authentication_method = power_bi_model.value.authentication_method
                      model_name            = power_bi_model.value.model_name
                      overwrite_existing    = power_bi_model.value.overwrite_existing
                      storage_mode          = power_bi_model.value.storage_mode
                      workspace_name        = power_bi_model.value.workspace_name
                    }
                  }
                  refresh_after_update = power_bi_task.value.refresh_after_update
                  dynamic "tables" {
                    for_each = power_bi_task.value.tables != null ? power_bi_task.value.tables : []
                    content {
                      catalog      = tables.value.catalog
                      name         = tables.value.name
                      schema       = tables.value.schema
                      storage_mode = tables.value.storage_mode
                    }
                  }
                  warehouse_id = power_bi_task.value.warehouse_id
                }
              }
              dynamic "python_wheel_task" {
                for_each = task.value.python_wheel_task != null ? [task.value.python_wheel_task] : []
                content {
                  entry_point      = python_wheel_task.value.entry_point
                  named_parameters = python_wheel_task.value.named_parameters
                  package_name     = python_wheel_task.value.package_name
                  parameters       = python_wheel_task.value.parameters
                }
              }
              retry_on_timeout = task.value.retry_on_timeout
              run_if           = task.value.run_if
              dynamic "run_job_task" {
                for_each = task.value.run_job_task != null ? [task.value.run_job_task] : []
                content {
                  job_id         = run_job_task.value.job_id
                  job_parameters = run_job_task.value.job_parameters
                }
              }
              dynamic "spark_jar_task" {
                for_each = task.value.spark_jar_task != null ? [task.value.spark_jar_task] : []
                content {
                  jar_uri         = spark_jar_task.value.jar_uri
                  main_class_name = spark_jar_task.value.main_class_name
                  parameters      = spark_jar_task.value.parameters
                }
              }
              dynamic "spark_python_task" {
                for_each = task.value.spark_python_task != null ? [task.value.spark_python_task] : []
                content {
                  parameters  = spark_python_task.value.parameters
                  python_file = spark_python_task.value.python_file
                  source      = spark_python_task.value.source
                }
              }
              dynamic "spark_submit_task" {
                for_each = task.value.spark_submit_task != null ? [task.value.spark_submit_task] : []
                content {
                  parameters = spark_submit_task.value.parameters
                }
              }
              dynamic "sql_task" {
                for_each = task.value.sql_task != null ? [task.value.sql_task] : []
                content {
                  dynamic "alert" {
                    for_each = sql_task.value.alert != null ? [sql_task.value.alert] : []
                    content {
                      alert_id            = alert.value.alert_id
                      pause_subscriptions = alert.value.pause_subscriptions
                      dynamic "subscriptions" {
                        for_each = alert.value.subscriptions != null ? alert.value.subscriptions : []
                        content {
                          destination_id = subscriptions.value.destination_id
                          user_name      = subscriptions.value.user_name
                        }
                      }
                    }
                  }
                  dynamic "dashboard" {
                    for_each = sql_task.value.dashboard != null ? [sql_task.value.dashboard] : []
                    content {
                      custom_subject      = dashboard.value.custom_subject
                      dashboard_id        = dashboard.value.dashboard_id
                      pause_subscriptions = dashboard.value.pause_subscriptions
                      dynamic "subscriptions" {
                        for_each = dashboard.value.subscriptions != null ? dashboard.value.subscriptions : []
                        content {
                          destination_id = subscriptions.value.destination_id
                          user_name      = subscriptions.value.user_name
                        }
                      }
                    }
                  }
                  dynamic "file" {
                    for_each = sql_task.value.file != null ? [sql_task.value.file] : []
                    content {
                      path   = file.value.path
                      source = file.value.source
                    }
                  }
                  parameters = sql_task.value.parameters
                  dynamic "query" {
                    for_each = sql_task.value.query != null ? [sql_task.value.query] : []
                    content {
                      query_id = query.value.query_id
                    }
                  }
                  warehouse_id = sql_task.value.warehouse_id
                }
              }
              task_key        = task.value.task_key
              timeout_seconds = task.value.timeout_seconds
              dynamic "webhook_notifications" {
                for_each = task.value.webhook_notifications != null ? [task.value.webhook_notifications] : []
                content {
                  dynamic "on_duration_warning_threshold_exceeded" {
                    for_each = webhook_notifications.value.on_duration_warning_threshold_exceeded != null ? webhook_notifications.value.on_duration_warning_threshold_exceeded : []
                    content {
                      id = on_duration_warning_threshold_exceeded.value.id
                    }
                  }
                  dynamic "on_failure" {
                    for_each = webhook_notifications.value.on_failure != null ? webhook_notifications.value.on_failure : []
                    content {
                      id = on_failure.value.id
                    }
                  }
                  dynamic "on_maintenance_complete" {
                    for_each = webhook_notifications.value.on_maintenance_complete != null ? webhook_notifications.value.on_maintenance_complete : []
                    content {
                      id = on_maintenance_complete.value.id
                    }
                  }
                  dynamic "on_maintenance_start" {
                    for_each = webhook_notifications.value.on_maintenance_start != null ? webhook_notifications.value.on_maintenance_start : []
                    content {
                      id = on_maintenance_start.value.id
                    }
                  }
                  dynamic "on_start" {
                    for_each = webhook_notifications.value.on_start != null ? webhook_notifications.value.on_start : []
                    content {
                      id = on_start.value.id
                    }
                  }
                  dynamic "on_streaming_backlog_exceeded" {
                    for_each = webhook_notifications.value.on_streaming_backlog_exceeded != null ? webhook_notifications.value.on_streaming_backlog_exceeded : []
                    content {
                      id = on_streaming_backlog_exceeded.value.id
                    }
                  }
                  dynamic "on_success" {
                    for_each = webhook_notifications.value.on_success != null ? webhook_notifications.value.on_success : []
                    content {
                      id = on_success.value.id
                    }
                  }
                }
              }
            }
          }
          timeout_seconds = settings.value.timeout_seconds
          dynamic "trigger" {
            for_each = settings.value.trigger != null ? [settings.value.trigger] : []
            content {
              dynamic "file_arrival" {
                for_each = trigger.value.file_arrival != null ? [trigger.value.file_arrival] : []
                content {
                  min_time_between_triggers_seconds = file_arrival.value.min_time_between_triggers_seconds
                  url                               = file_arrival.value.url
                  wait_after_last_change_seconds    = file_arrival.value.wait_after_last_change_seconds
                }
              }
              pause_status = trigger.value.pause_status
              dynamic "periodic" {
                for_each = trigger.value.periodic != null ? [trigger.value.periodic] : []
                content {
                  interval = periodic.value.interval
                  unit     = periodic.value.unit
                }
              }
              dynamic "table_update" {
                for_each = trigger.value.table_update != null ? [trigger.value.table_update] : []
                content {
                  condition                         = table_update.value.condition
                  min_time_between_triggers_seconds = table_update.value.min_time_between_triggers_seconds
                  table_names                       = table_update.value.table_names
                  wait_after_last_change_seconds    = table_update.value.wait_after_last_change_seconds
                }
              }
            }
          }
          dynamic "webhook_notifications" {
            for_each = settings.value.webhook_notifications != null ? [settings.value.webhook_notifications] : []
            content {
              dynamic "on_duration_warning_threshold_exceeded" {
                for_each = webhook_notifications.value.on_duration_warning_threshold_exceeded != null ? webhook_notifications.value.on_duration_warning_threshold_exceeded : []
                content {
                  id = on_duration_warning_threshold_exceeded.value.id
                }
              }
              dynamic "on_failure" {
                for_each = webhook_notifications.value.on_failure != null ? webhook_notifications.value.on_failure : []
                content {
                  id = on_failure.value.id
                }
              }
              dynamic "on_maintenance_complete" {
                for_each = webhook_notifications.value.on_maintenance_complete != null ? webhook_notifications.value.on_maintenance_complete : []
                content {
                  id = on_maintenance_complete.value.id
                }
              }
              dynamic "on_maintenance_start" {
                for_each = webhook_notifications.value.on_maintenance_start != null ? webhook_notifications.value.on_maintenance_start : []
                content {
                  id = on_maintenance_start.value.id
                }
              }
              dynamic "on_start" {
                for_each = webhook_notifications.value.on_start != null ? webhook_notifications.value.on_start : []
                content {
                  id = on_start.value.id
                }
              }
              dynamic "on_streaming_backlog_exceeded" {
                for_each = webhook_notifications.value.on_streaming_backlog_exceeded != null ? webhook_notifications.value.on_streaming_backlog_exceeded : []
                content {
                  id = on_streaming_backlog_exceeded.value.id
                }
              }
              dynamic "on_success" {
                for_each = webhook_notifications.value.on_success != null ? webhook_notifications.value.on_success : []
                content {
                  id = on_success.value.id
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

