# 🌍 Infrastructure as Code (IaC) Using Terraform

## � Overview

This project leverages **Terraform** to automate the provisioning and management of infrastructure on **AWS**. It ensures consistency, scalability, and repeatability across environments. The infrastructure includes networking, security, compute, load balancing, storage, monitoring, and auto-scaling components.

---

## 🔧 Modules & Resources

The project is organized into the following modules:

### 1. **Networking (🛡️ VPC & Subnets)**
   - Creates a **VPC** (Virtual Private Cloud) with public and private subnets.
   - Configures route tables, internet gateways, and NAT gateways.

### 2. **Security (🔒 Key Pair & Security Groups)**
   - Generates an **SSH key pair** for secure access to EC2 instances.
   - Defines **security groups** to manage inbound and outbound traffic.

### 3. **Compute (💻 EC2 Instances & AMI)**
   - Deploys **EC2 instances** within the specified subnets.
   - Creates an **AMI** (Amazon Machine Image) from an EC2 instance for future deployments.

### 4. **Load Balancing (🏋️️ ALB & Target Group)**
   - Sets up an **Application Load Balancer (ALB)** to distribute traffic.
   - Defines a **target group** for EC2 instances.
   - Configures a **listener** to route traffic to the target group.

### 5. **Storage (💾 S3 Buckets)**
   - Deploys an **S3 bucket** for object storage.

### 6. **Monitoring & Logging (🔄 CloudWatch & CloudTrail)**
   - Enables **CloudWatch** monitoring for EC2 instances.
   - Configures **CloudTrail** to track AWS API activity.

### 7. **Auto Scaling (🛠️ Auto Scaling & Alarms)**
   - Configures **Auto Scaling Groups (ASG)** to dynamically adjust the number of EC2 instances.
   - Sets up **CloudWatch alarms** to trigger auto-scaling actions.

---

## 🛠️ Setup & Execution

### Prerequisites
- **Terraform** installed on your local machine.
- **AWS CLI** configured with valid credentials.
- An existing **SSH key pair** (optional, as one can be generated).

### Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Preview the Deployment Plan**
   ```bash
   terraform init
   ```

4. **Destroy the Infrastructure (If Needed)**
   ```bash
   terraform destroy -auto-approve
   ```