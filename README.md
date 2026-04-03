# Azure Terraform CI/CD Project

## Overview
This project demonstrates automated Azure infrastructure deployment using Terraform and GitHub Actions.

The solution provisions a small Azure environment using Infrastructure as Code, with Terraform state stored in an Azure Storage Account backend. The objective was to transition from manual deployment to a more consistent, repeatable, and automated approach.

## Architecture
![Architecture Diagram](https://github.com/user-attachments/assets/5abd560c-cedc-4d14-999a-1029384af6d2)


## Infrastructure Components
- Azure Resource Group
- Virtual Network
- Subnet
- Network Security Group (NSG)
- Windows Virtual Machine
- Azure Storage Account for Terraform backend state

## CI/CD Workflow
This project uses GitHub Actions to automate the Terraform workflow:
- Terraform init
- Terraform format check
- Terraform validate
- Terraform plan
- Terraform apply

## Key Outcomes
- Reduced deployment time from manual provisioning to automated pipeline execution
- Improved consistency across repeated deployments
- Reduced manual configuration errors
- Enabled faster environment rebuild for testing and validation

## Tech Stack
- Terraform
- Microsoft Azure
- GitHub Actions
- Azure CLI

## Repository
https://github.com/mamun-create/azure-terraform-lab

## Summary
This project demonstrates practical experience in building and automating Azure infrastructure using Infrastructure as Code and CI/CD pipelines, aligned with modern cloud engineering practices.
