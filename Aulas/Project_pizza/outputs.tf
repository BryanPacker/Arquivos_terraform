output "performance" {
  value = {
    for key, perf in data.aws_ec2_instance_type.performance_info : key => {
      instance_name = var.instances[key].instance_name
      instance_type = var.instances[key].instance_type
      vcpus         = perf.default_vcpus
      memory_gb     = perf.memory_size / 1024
      network       = perf.network_performance
    }
  }
  }
