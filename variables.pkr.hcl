####### Promox Admin info
variable "proxmox_host" {
  type = string
  default = "pve"
}
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
}
variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}
variable "proxmox_skip_tls_verify" {
  type = bool
  default = false
}

####### ISO locations
variable "windows_iso_file" {
  type    = string
  default = "local:iso/Win10_22H2_EnglishInternational_x64v1.iso"
}

variable "virtio_iso_file" {
  type    = string
  default = "local:iso/virtio-win-0.1.240.iso"
}

####### VM Spec
variable "template_description" {
  type    = string
  default = "Windows 10 Pro x64"
}

variable "vm_name" {
  type    = string
  default = "Win10x64-VM-template"
}
variable "vm_cpu_cores" {
  type    = string
  default = "4"
}
variable "vm_disk_size" {
  type    = string
  default = "60G"
}
variable "vm_memory" {
  type    = string
  default = "8192"
}

variable "vm_vlan" {
  type    = number
  default = "0"
}

####### WinRM
variable "user_name" {
  type    = string
  default = "vagrant"
}
variable "user_password" {
  type    = string
  default = "vagrant"
}

######## SSH
variable "github_user" {
  type    = string
}


