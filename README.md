# Azure Infrastructure with Terraform and GitHub Actions

A hands-on Azure infrastructure project demonstrating Infrastructure as Code (IaC), Terraform remote state, network configuration and CI/CD automation with GitHub Actions.

## Project overview

I built this project to move an Azure deployment from manual portal configuration to a repeatable Terraform workflow. The environment provisions the core networking and compute resources for a Windows workload, while GitHub Actions performs Terraform validation, planning and controlled deployment.

The project also demonstrates practical security considerations: credentials are not stored in Terraform source code, RDP access is restricted to an explicitly supplied source IP/CIDR, Terraform state is stored remotely, and pull requests run validation and planning without automatically applying infrastructure changes.

## Architecture

![Architecture Diagram](https://github.com/user-attachments/assets/5abd560c-cedc-4d14-999a-1029384af6d2)

## Infrastructure components

- Azure Resource Group
- Azure Virtual Network and subnet
- Network Security Group (NSG)
- Static Public IP and network interface
- Windows Server virtual machine
- Azure Storage Account and private container for Terraform remote state

## Terraform and CI/CD workflow

The GitHub Actions workflow performs:

1. Checkout repository
2. Configure Terraform
3. Authenticate to Azure using GitHub secrets
4. `terraform init`
5. `terraform fmt -check`
6. `terraform validate`
7. `terraform plan`
8. `terraform apply` only for pushes to the `main` branch

Pull requests therefore provide a validation and plan stage without automatically changing Azure infrastructure.

## Security considerations

- VM administrator password is defined as a sensitive Terraform variable and supplied outside the source code.
- RDP source access is supplied as an explicit IP/CIDR variable instead of allowing TCP 3389 from the entire internet.
- Azure authentication values are stored in GitHub Actions secrets rather than committed to the repository.
- Terraform state is stored in a private Azure Storage container.
- `.gitignore` is used to keep local Terraform working files and state out of source control.

> This repository is a portfolio/pre-production implementation. A production deployment would normally add controls such as workload identity/OIDC, environment approvals, stronger state-storage controls, monitoring, backup, private administration paths and organization-specific security policies.

## Configuration inputs

The deployment expects the following sensitive/environment-specific values to be supplied securely rather than committed:

- `TF_VAR_vm_admin_password`
- `TF_VAR_rdp_source_address_prefix`
- `AZURE_CREDENTIALS` for the current GitHub Actions authentication method

For local testing, Terraform variables can be supplied through environment variables or an untracked `.tfvars` file.

## Key outcomes

- Built repeatable Azure infrastructure using Terraform
- Implemented remote Terraform state in Azure Storage
- Automated format checking, validation, planning and deployment with GitHub Actions
- Separated sensitive configuration from Terraform source code
- Applied a restricted RDP network rule instead of an unrestricted internet-facing rule
- Practised troubleshooting across Terraform, Azure and CI/CD workflows

## Technologies demonstrated

**Cloud:** Microsoft Azure  
**Infrastructure as Code:** Terraform  
**CI/CD:** GitHub Actions  
**Administration:** Azure CLI  
**Networking:** VNet, subnet, NSG, public/private addressing  
**Compute:** Azure Windows VM

## Repository structure

```text
.
├── .github/workflows/terraform.yml
├── .gitignore
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

## Scope

This project was created as a controlled hands-on implementation for developing and demonstrating Azure infrastructure and automation skills. It is not presented as a complete production architecture.
