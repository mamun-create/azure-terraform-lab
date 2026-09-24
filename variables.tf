variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-terraform-lab-01"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Australia East"
}

variable "vm_admin_username" {
  description = "Local administrator username for the Windows VM"
  type        = string
  default     = "azureuser"
}

variable "vm_admin_password" {
  description = "Local administrator password for the Windows VM. Supply securely through TF_VAR_vm_admin_password or CI/CD secrets."
  type        = string
  sensitive   = true
}

variable "rdp_source_address_prefix" {
  description = "Approved public IP/CIDR allowed to reach RDP, for example 203.0.113.10/32"
  type        = string
}
