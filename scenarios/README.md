# Scenario-based Playbooks

This directory contains standalone, scenario-based playbooks designed for quick, end-to-end automation of common server configurations.

## Available Scenarios

- **Setup Docker ([setup_docker.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_docker.yml))**  
  Installs Docker CE, configures the Docker daemon, installs docker-compose, and adds the current user to the Docker group.
- **Setup Kubernetes ([setup_kubernetes.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_kubernetes.yml))**  
  Installs lightweight Kubernetes (K3s), installs `kubectl`, and configures kubeconfig access for the user.
- **Setup Nginx ([setup_nginx.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_nginx.yml))**  
  Installs Nginx, configures a clean virtual host template, and sets up UFW firewall rules.
- **Setup PostgreSQL ([setup_postgresql.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_postgresql.yml))**  
  Installs PostgreSQL database engine, enables network-wide listen addresses, sets up a custom pg_hba whitelist block, and provisions database users.
- **SSH Hardening & Fail2ban ([setup_ssh_hardening.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_ssh_hardening.yml))**  
  Hardens sshd configurations (disables root passwords, enforces keys) and deploys Fail2ban server-side protection.
- **Prometheus & Grafana ([setup_prometheus_grafana.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_prometheus_grafana.yml))**  
  Deploys docker container instances of Prometheus and Grafana for system monitoring configurations.
- **Format and Mount AWS EBS Volume ([aws_mount_ebs.yml](file:///Users/sany/Projects/learning-ansible/scenarios/aws_mount_ebs.yml))**  
  Automates checking block devices, formatting unformatted EBS volumes to ext4, and configuring automatic persistence in `/etc/fstab`.
- **AWS CloudWatch Agent Setup ([aws_cloudwatch_agent.yml](file:///Users/sany/Projects/learning-ansible/scenarios/aws_cloudwatch_agent.yml))**  
  Downloads, installs, and deploys configuration settings to pipe local auth logs and metrics (disk/memory) directly to AWS CloudWatch.
- **Setup Jenkins ([setup_jenkins.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_jenkins.yml))**  
  Installs OpenJDK, registers official repositories, installs Jenkins CI/CD engine, opens port 8080, and prints the initial administration setup password.
- **Setup HashiCorp Tools ([setup_hashicorp_tools.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_hashicorp_tools.yml))**  
  Sets up the HashiCorp packages repository and installs Terraform, Packer, and Vault.
- **Setup Portainer ([setup_portainer.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_portainer.yml))**  
  Deploys Portainer Community Edition in Docker to manage containers, volumes, and networks via a web graphical user interface.
- **Setup MySQL ([setup_mysql.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_mysql.yml))**  
  Installs MySQL Server, binds to all interfaces, and provisions a database and admin user.
- **Setup Redis ([setup_redis.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_redis.yml))**  
  Installs and secures Redis Server, allowing authenticated remote connections on port 6379.
- **Setup Apache ([setup_apache.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_apache.yml))**  
  Installs Apache2, configures custom listening ports, and sets up a default document root.
- **Setup Locust ([setup_locust.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_locust.yml))**  
  Installs Locust load testing tool, generates a systemd service daemon, and sets up a default locustfile test script.
- **Setup ELK Stack ([setup_elk.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_elk.yml))**  
  Spins up Elasticsearch and Kibana containers inside a shared network for logging administration.
- **Setup Swap File ([setup_swap.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_swap.yml))**  
  Allocates, formats, and activates swap space on low-end EC2 servers to prevent Out-Of-Memory daemon terminations.
- **Setup Node Exporter ([setup_node_exporter.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_node_exporter.yml))**  
  Downloads and registers Prometheus Node Exporter as a systemd service daemon to expose host metrics.
- **Setup Certbot ([setup_certbot.yml](file:///Users/sany/Projects/learning-ansible/scenarios/setup_certbot.yml))**  
  Configures Snap and installs Certbot client for Let's Encrypt automated SSL certificate generation.

---

### Full Catalog

All **80+ playbooks** listed under the [scenarios.md](file:///Users/sany/Projects/learning-ansible/scenarios/scenarios.md) guide have been fully scaffolded and generated! Refer to the [scenarios.md](file:///Users/sany/Projects/learning-ansible/scenarios/scenarios.md) file for a categorised index of every single playbook.





