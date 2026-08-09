# 🚀 Azure Landing Zone — Terraform Monolithic Infrastructure

> **Enterprise-style Azure Landing Zone infrastructure provisioned using Terraform and automated through GitHub Actions CI/CD.**

![Azure](https://img.shields.io/badge/Microsoft%20Azure-0089D6?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![IaC](https://img.shields.io/badge/Infrastructure%20as%20Code-IaC-success?style=for-the-badge)

---

## 📌 Project Overview

This repository demonstrates an **Azure Landing Zone-based infrastructure implementation using Terraform**.

The infrastructure follows Azure Landing Zone design principles to establish a structured, scalable, and governed Azure environment.

The project uses a **Terraform monolithic environment layer** that consumes reusable child modules for provisioning Azure resources.

Infrastructure deployment is automated using **GitHub Actions**, enabling a complete Infrastructure-as-Code workflow:

```text
Developer
    │
    │ git push
    ▼
feature1
    │
    ▼
GitHub Actions
    │
    ├── Terraform Format
    ├── Terraform Validate
    ├── Terraform Plan
    │
    ▼
Pull Request
    │
    ▼
Code Review
    │
    ▼
main
    │
    ▼
GitHub Actions
    │
    └── Terraform Apply
             │
             ▼
           Azure

```
##  🏗️ Architecture

The infrastructure is designed around Azure Landing Zone concepts, providing a structured foundation for Azure workloads.

High-Level Architecture
```text
                         Azure Cloud
                              │
                    ┌─────────┴─────────┐
                    │   Azure Landing   │
                    │       Zone        │
                    └─────────┬─────────┘
                              │
                       ┌──────┴──────┐
                       │  Networking │
                       └──────┬──────┘
                              │
                       ┌──────┴──────┐
                       │   Dev VNet  │
                       │  10.x.x.x   │
                       └──────┬──────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
          ▼                   ▼                   ▼
   Frontend Subnet      Backend Subnet    Azure Bastion
          │                   │                   │
          ▼                   ▼                   ▼
     Application          Backend            Secure
      Workloads          Workloads           Access
```           


## 🧩 Infrastructure Components

This project provisions Azure infrastructure using reusable Terraform modules.

Networking
```text
🌐 Azure Virtual Network
🔹 Azure Subnets
🔐 Azure Bastion
⚖️ Azure Load Balancer
🚪 Azure NAT Gateway
🌍 Application Gateway
Compute
💻 Azure Virtual Machines
Storage
📦 Azure Storage Account
Resource Management
📁 Azure Resource Groups
```
The modular design makes it easier to add or remove infrastructure components without duplicating Terraform code.


## 📁 Repository Structure

```text
Terraform_Monolithic_LandingZone/
│
├── .github/
│   └── workflows/
│       ├── terraform-plan.yml
│       └── terraform-apply.yml
│
├── Child_Module/
│   │
│   ├── azurerm_application_gateway/
│   ├── azurerm_bastion/
│   ├── azurerm_load_balancer/
│   ├── azurerm_nat_gateway/
│   ├── azurerm_resource_group/
│   ├── azurerm_storage_account/
│   ├── azurerm_subnet/
│   ├── azurerm_virtual_machine/
│   └── azurerm_virtual_network/
│
├── Environments/
│   └── PreProd/
│       ├── main.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
├── .gitignore
└── README.md
```

## 🧱 Terraform Design

The project follows a Monolithic Environment + Reusable Child Modules approach.
```text
                Environments/PreProd
                        │
                     main.tf
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
       VNet Module   Subnet Module   VM Module
          │             │             │
          ▼             ▼             ▼
       Azure VNet     Subnets        VMs
```
Why this approach?

The environment layer acts as the composition layer, while individual resources are encapsulated inside reusable modules.

This provides:
```text
♻️ Reusability
🧩 Separation of responsibilities
📖 Cleaner Terraform code
🔧 Easier maintenance
📈 Better scalability
🚀 Simplified infrastructure provisioning
```

## 🔄 CI/CD Pipeline
Infrastructure deployment is automated using GitHub Actions.

Feature Branch — Terraform Plan

Developers work on:
```text
feature1
```
When code is pushed:
```text
git push origin feature1
```
GitHub Actions automatically executes:
```text
Terraform Format
        ↓
Terraform Validate
        ↓
Terraform Init
        ↓
Terraform Plan
```
This provides early feedback before infrastructure changes are merged.

## 🔀 Pull Request Workflow

After the infrastructure changes are validated:
```text
feature1
   │
   │ Pull Request
   ▼
  main
```
The Terraform plan can be reviewed before merging.

This provides an additional control point for infrastructure changes.

## 🚀 Production Deployment Flow
After the Pull Request is approved and merged into **main**:
```text
PR Merge
   │
   ▼
main branch
   │
   ▼
GitHub Actions
   │
   ├── Terraform Init
   ├── Terraform Validate
   └── Terraform Apply
            │
            ▼
        Azure Infrastructure
```
This creates a controlled Infrastructure-as-Code deployment workflow.

## 🔐 Secure Azure Authentication

GitHub Actions authenticates with Azure using OpenID Connect (OIDC).

No long-lived Azure client secret is required for the GitHub Actions authentication flow.

```text
GitHub Actions
      │
      │ OIDC Token
      ▼
Microsoft Entra ID
      │
      │ Federated Identity
      ▼
Azure
```
**Federated Identity Credentials** are configured to establish trust between the GitHub repository and Azure.

This improves security by avoiding the need to store long-lived Azure credentials in GitHub.

## 🔑 GitHub → Azure Authentication Flow

```text
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions Runner
    │
    │ OIDC Token
    ▼
Microsoft Entra ID
    │
    │ Federated Identity Credential
    ▼
Azure Subscription
    │
    ▼
Terraform
    │
    ▼
Azure Resources
```

## 🛠️ Technologies Used

```text
| Technology            | Purpose                              |
| --------------------- | ------------------------------------ |
| ☁️ Microsoft Azure    | Cloud Infrastructure                 |
| 🏗️ Terraform         | Infrastructure as Code               |
| 🔄 GitHub Actions     | CI/CD Automation                     |
| 🔐 Microsoft Entra ID | Identity & Authentication            |
| 🔑 OIDC               | Passwordless workload authentication |
| 🐙 Git/GitHub         | Source Code Management               |
| 🧩 Terraform Modules  | Infrastructure Reusability           |
```

## 📋 Prerequisites

Before using this repository, make sure you have:

Azure Subscription
GitHub Account
Terraform installed
Azure CLI installed
Git installed
Appropriate Azure permissions
GitHub Actions enabled

Verify Terraform:
```text
terraform version
```
```text
az version
```
```text
az login
```

## 🚀 Local Terraform Usage

Navigate to the environment:
```text
cd Environments/PreProd
```
Initialize Terraform:
```text
terraform init
```
Validate configuration:
```text
terraform validate
```
Format Terraform files:
```text
terraform fmt
```
Review the execution plan:
```text
terraform plan
```
Apply infrastructure:
```text
terraform apply
```

## 🔄 Git Workflow

Create/switch to the feature branch:
```text
git checkout feature1
```
Make your changes and commit:
```text
git add .
git commit -m "Update Azure infrastructure"
```
Push the changes:
```text
git push origin feature1
```
GitHub Actions automatically runs the Terraform validation and plan workflow.
After review:
```text
feature1 → Pull Request → main
```

## 🎯 Key DevOps Practices Demonstrated
This project demonstrates several real-world DevOps and Cloud Engineering practices:

**Infrastructure as Code**

Azure infrastructure is defined and managed using Terraform instead of manual portal-based provisioning.

**Modular Terraform Design**

Reusable child modules reduce duplication and improve maintainability.

**Automated CI/CD**

Infrastructure changes are automatically validated and deployed through GitHub Actions.

**Branch-Based Workflow**

Feature branches are used to isolate infrastructure changes before merging.

**Pull Request Based Review**

Infrastructure changes can be reviewed before reaching the main branch.

**Secure Authentication**

GitHub Actions uses OIDC-based authentication with Microsoft Entra ID.

**Azure Landing Zone Principles**

The infrastructure follows Landing Zone concepts to provide a structured foundation for Azure workloads.

**Infrastructure Consistency**

Terraform provides repeatable and predictable infrastructure deployments.

## 👨‍💻 Author

**Akram Raza**

Cloud & DevOps Engineer

**Areas of Interest**
- Microsoft Azure
- Terraform / Infrastructure as Code
- DevOps & CI/CD
- GitHub Actions
- Azure Landing Zones
- Cloud Architecture
- Kubernetes
- Docker
- Infrastructure Automation


## 📜 Disclaimer

This repository is created for **learning**, **demonstration**, and **portfolio purposes**.

Always review Terraform plans and Azure costs before deploying infrastructure in a production subscription.
```text
📜 Disclaimer

This repository is created for learning, demonstration, and portfolio purposes.

Always review Terraform plans and Azure costs before deploying infrastructure in a production subscription.
```
