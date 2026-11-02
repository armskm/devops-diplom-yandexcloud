###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### network vars
variable "VPC_name" {
  type        = string
  default     = "k8s-net"
}

variable "public_subnet_name" {
  type        = string
  default     = "public"
}

variable "public_subnet_zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-d",  "ru-central1-e"]
}

### ssh vars
locals {
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIsIQmdqEbYmORtzxErWWcyvPsXTPpIKR4FAMdymIrG root@deb12"
}

### k8s vars
variable "vpc_zones_master" {
  type    = list(string)
  default = ["ru-central1-a"]
}

variable "vm_os" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "vm_platform" {
  type    = string
  default = "standard-v3"
}

variable "vm_preemptible" {
  type    = bool
  default = true
}

variable "vm_nat" {
  type    = bool
  default = true
}

variable "vm_res" {
  type = list(object({  vm_name=string, cpu=number, ram=number, core_fr=number, disk_volume=number }))
  default = [
    {
      vm_name     = "master"
      cpu         = 2
      ram         = 4
      core_fr     = 20
      disk_volume = 40
    },
    {
      vm_name     = "node"
      cpu         = 2
      ram         = 2
      core_fr     = 20
      disk_volume = 20
    }
  ]
}