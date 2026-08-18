# Platform Core

Production-ready Infrastructure as Code (IaC) project for provisioning AWS compute infrastructure and automating Kubernetes cluster deployment using Terraform, Ansible, and kubeadm.

## Overview

Platform Core automates the deployment of a Kubernetes environment on AWS by combining infrastructure provisioning, configuration management, and cluster bootstrap into a single workflow.

Terraform provisions the required EC2 infrastructure, while Ansible prepares the hosts, installs Kubernetes components, bootstraps the control plane, joins worker nodes, and deploys essential platform services.

## Architecture

```text
Terraform
    │
    ▼
AWS EC2 Infrastructure
    │
    ▼
Ansible Configuration
    │
    ├── Host Preparation
    ├── Containerd Installation
    ├── Kubernetes Package Installation
    └── Cluster Bootstrap Automation
    │
    ▼
kubeadm
    │
    ├── Control Plane Initialization
    └── Worker Node Join
    │
    ▼
Kubernetes Cluster
    │
    ├── Calico CNI
    ├── NGINX Ingress Controller
    ├── Local Path Provisioner
    └── kube-prometheus-stack
         ├── Prometheus
         └── Grafana
```

## Features

### Infrastructure Provisioning

* AWS EC2 instance provisioning with Terraform
* Configurable node count for control plane and worker nodes
* Infrastructure lifecycle management through Infrastructure as Code

### Kubernetes Cluster Automation

* Automated Kubernetes cluster bootstrap using kubeadm
* Control plane initialization and worker node registration
* Automated installation of Kubernetes components
* Container runtime configuration with containerd

### Configuration Management

* Host preparation and system configuration using Ansible
* Kubernetes prerequisite installation and configuration
* Reusable Ansible roles and playbooks
* Consistent and repeatable cluster deployments

### Platform Services

* Calico Container Network Interface (CNI)
* NGINX Ingress Controller
* Local Path Provisioner for dynamic storage provisioning
* Prometheus and Grafana monitoring stack via kube-prometheus-stack

## Technology Stack

| Category                 | Technology          |
| ------------------------ | ------------------- |
| Cloud Platform           | AWS                 |
| Infrastructure as Code   | Terraform           |
| Configuration Management | Ansible             |
| Container Runtime        | containerd          |
| Container Orchestration  | Kubernetes          |
| Cluster Bootstrap        | kubeadm             |
| Package Management       | Helm                |
| Networking               | Calico              |
| Monitoring               | Prometheus, Grafana |
| Operating System         | Ubuntu Linux        |

## Repository Structure

```text
platform-core/
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── main.tf
│   └── outputs.tf
│
├── ansible/
│   ├── inventory.ini
│   ├── site.yml
│   └── roles/
│
├── README.md
└── PROJECT_DOCUMENTATION.md
```

## Deployment Workflow

### 1. Provision Infrastructure

```bash
cd terraform

terraform init
terraform plan
terraform apply
```

### 2. Configure Kubernetes Cluster

```bash
cd ansible

ansible-playbook -i inventory.ini site.yml
```

### 3. Validate Deployment

```bash
kubectl get nodes

kubectl get pods -A
```

## Deployment Flow

1. Terraform provisions AWS EC2 instances.
2. Ansible prepares Ubuntu hosts and installs Kubernetes dependencies.
3. containerd is installed and configured as the container runtime.
4. kubeadm initializes the Kubernetes control plane.
5. Worker nodes join the cluster.
6. Calico networking is deployed.
7. Helm is installed on the control plane.
8. NGINX Ingress Controller is deployed.
9. Local Path Provisioner is configured as the default storage class.
10. kube-prometheus-stack is installed, providing Prometheus and Grafana monitoring.

## Requirements

* AWS account
* Existing AWS SSH key pair
* Existing AWS security group
* Terraform
* Ansible
* kubectl
* SSH access to target instances

```
```
