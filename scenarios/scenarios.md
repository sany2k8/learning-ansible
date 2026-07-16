# Ansible EC2 Learning Scenarios

> A collection of practical Ansible scenarios for learning infrastructure automation on AWS EC2.
>
> **Scope:** EC2 instances only (no RDS, ECS, EKS, S3, ALB, or other managed AWS services).

---

# Existing Scenarios

```text
aws_cloudwatch_agent.yml
aws_mount_ebs.yml
setup_docker.yml
setup_hashicorp_tools.yml
setup_jenkins.yml
setup_kubernetes.yml
setup_nginx.yml
setup_portainer.yml
setup_postgresql.yml
setup_prometheus_grafana.yml
setup_ssh_hardening.yml
```

---

# Infrastructure

```text
setup_fail2ban.yml
setup_firewalld.yml
setup_ufw.yml
setup_ntp.yml
setup_chrony.yml
setup_logrotate.yml
setup_swap.yml
setup_hostname.yml
setup_timezone.yml
setup_sysctl.yml
setup_kernel_tuning.yml
setup_users_groups.yml
setup_sudo.yml
setup_mount_disk.yml
setup_dns_resolver.yml
setup_unattended_upgrades.yml
```

### Learn

- Kernel tuning
- limits.conf
- sysctl
- Swap
- Firewall
- SSH
- System configuration

---

# Programming Runtimes

```text
setup_python.yml
setup_nodejs.yml
setup_golang.yml
setup_rust.yml
setup_php.yml
```

Deploy sample applications afterward.

---

# Databases

```text
setup_mysql.yml
setup_mariadb.yml
setup_redis.yml
setup_mongodb.yml
setup_clickhouse.yml
```

### Practice

- Create users
- Create databases
- Configure replication
- Performance tuning
- Backup automation

---

# Web Servers

```text
setup_apache.yml
setup_haproxy.yml
setup_traefik.yml
setup_caddy.yml
```

---

# SSL

```text
setup_certbot.yml
setup_self_signed_ssl.yml
```

### Practice

- Generate certificates
- Configure HTTPS
- Redirect HTTP → HTTPS

---

# Containers

```text
setup_podman.yml
setup_containerd.yml
setup_buildah.yml
```

Ideal for Kubernetes and container runtime practice.

---

# CI/CD

```text
setup_gitlab_runner.yml
setup_gitea.yml
setup_drone_ci.yml
setup_nexus.yml
setup_sonarqube.yml
```

All can be self-hosted on EC2.

---

# Monitoring

```text
setup_node_exporter.yml
setup_cadvisor.yml
setup_alertmanager.yml
setup_blackbox_exporter.yml
setup_loki.yml
setup_promtail.yml
setup_vector.yml
setup_telegraf.yml
```

---

# Logging

```text
setup_elasticsearch.yml
setup_logstash.yml
setup_kibana.yml
setup_filebeat.yml
setup_fluentbit.yml
```

---

# Message Queue

```text
setup_rabbitmq.yml
setup_kafka.yml
setup_zookeeper.yml
setup_nats.yml
setup_activemq.yml
```

---

# Cache

```text
setup_memcached.yml
setup_varnish.yml
setup_redis_cluster.yml
```

---

# Reverse Proxy & Load Balancing

```text
setup_nginx_reverse_proxy.yml
setup_haproxy_lb.yml
setup_traefik_proxy.yml
```

---

# Storage

```text
setup_minio.yml
setup_nfs_server.yml
setup_nfs_client.yml
setup_samba.yml
```

Everything remains self-hosted on EC2.

---

# Authentication

```text
setup_openldap.yml
setup_keycloak.yml
setup_authelia.yml
```

---

# VPN

```text
setup_wireguard.yml
setup_openvpn.yml
setup_tailscale.yml
```

---

# Git

```text
setup_gitea.yml
setup_git_server.yml
```

---

# Artifact Repository

```text
setup_nexus.yml
setup_harbor.yml
```

---

# Secrets Management

```text
setup_vault.yml
setup_sops.yml
```

---

# Mail

```text
setup_postfix.yml
setup_mailhog.yml
```

MailHog is useful for local application testing.

---

# Utilities

```text
setup_tmux.yml
setup_zsh.yml
setup_htop.yml
setup_jq.yml
setup_tree.yml
```

---

# Load Testing

```text
setup_k6.yml
setup_jmeter.yml
setup_locust.yml
```

---

# Performance Testing

```text
setup_stress_ng.yml
setup_sysbench.yml
setup_fio.yml
```

Useful for benchmarking EC2 instances.

---

# Development Environment

```text
setup_code_server.yml
setup_jupyterlab.yml
setup_vscode_server.yml
```

---


---

# Suggested Learning Progression

1. Linux administration and system hardening
2. Web servers (Nginx, Apache, HAProxy)
3. Programming runtimes
4. Databases
5. Docker and container runtimes
6. CI/CD platforms
7. Monitoring stack
8. Logging stack
9. Message queues and caching
10. Storage services
11. Authentication and secrets management
12. Kubernetes
13. Performance testing and benchmarking
14. Complete end-to-end infrastructure deployments