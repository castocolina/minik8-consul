consul {
  retry {
    enabled = true
    attempts = 3
    backoff = "50ms"
    max_backoff = "10s"
  }
}

log_level = "info"
wait = "15s:30s"
# pid_file = "/var/run/consul-template.pid"
pid_file = "tmp/consul-template.pid"
