variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-terraform-lab-01"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Australia East"
}