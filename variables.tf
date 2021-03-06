variable "cluster_name" {
  description = "NKS cluster name"
  default     = ""
}

variable "organization_name" {
  description = "Existing NKS organization name"
  default     = ""
}

variable "provider_keyset_name" {
  description = "Existing NKS provider keyset name"
  default     = ""
}

variable "ssh_keyset_name" {
  description = "Existing NKS SSH keyset name"
  default     = ""
}

variable "ssh_key_path" {
  description = "Path to the public SSH key"
  default     = ""
}

variable "provider_code" {
  description = "Provider code (aws, azure, etc.)"
  default     = ""
}

variable "k8s_version" {
  description = "Kubernetes version"
  default     = ""
}

variable "platform" {
  description = "OS platform type"
  default     = "coreos"
}

variable "region" {
  description = "Provider region"
  default     = ""
}

variable "zone" {
  description = "Provider zone"
  default     = ""
}

variable "network_id" {
  description = "Provider network ID"
  default     = "__new__"
}

variable "network_cidr" {
  description = "Provider network CIDR"
  default     = "10.0.0.0/16"
}

variable "subnet_id" {
  description = "Provider subnet ID"
  default     = "__new__"
}

variable "subnet_cidr" {
  description = "Provider subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "master_size" {
  description = "Kubernetes master node size"
  default     = "t2.medium"
}

variable "worker_size" {
  description = "Kubernetes worker node size"
  default     = "t2.medium"
}

variable "worker_count" {
  description = "Kubernetes worker count"
  default     = "2"
}

variable "project_id" {
  description = "Provider project ID"
  default     = ""
}

variable "resource_group" {
  description = "Azure resource group"
  default     = "__new__"
}

variable "aws_access_key" {
  description = "AWS access key"
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  default     = ""
}

variable "azure_client_id" {
  description = "Azure client ID (or application ID)"
  default     = ""
}

variable "azure_client_secret" {
  description = "Azure client secret (or application token)"
  default     = ""
}

variable "azure_tenant_id" {
  description = "Azure tenant ID (or directory ID)"
  default     = ""
}

variable "azure_subscription_id" {
  description = "Azure subscription ID"
  default     = ""
}
