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
