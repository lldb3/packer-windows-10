packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}


source "proxmox-iso" "windows-10-pro-packer" {
  vm_id                    = 3000
  node                     = "${var.proxmox_host}"
  proxmox_url              = "${var.proxmox_api_url}"
  username                 = "${var.proxmox_api_token_id}"
  token                    = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = "${var.proxmox_skip_tls_verify}"
  os                       = "win10"
  scsi_controller          = "virtio-scsi-single"
  template_description     = "${var.template_description}"
  vm_name                  = "${var.vm_name}"
  cores                    = "${var.vm_cpu_cores}"
  cpu_type                 = "host"
  iso_file                 = "${var.windows_iso_file}"
  unmount_iso              = true
  memory                   = "${var.vm_memory}"
  #  http_directory           = "./"
  communicator             = "winrm"
  ssh_username             = "${var.user_name}"
  ssh_password             = "${var.user_password}"
  ssh_timeout              = "25m"
  winrm_insecure           = true
  winrm_password           = "${var.user_password}"
  winrm_use_ssl            = true
  winrm_username           = "${var.user_name}"

  additional_iso_files {
    cd_files = [
      "./files/Autounattend.xml", "scripts/colemak.ps1",
      "scripts/Windows10SysPrepDebloater.ps1", "scripts/upgrade_to_ps3.ps1",
      "scripts/ConfigureRemotingForAnsible.ps1"
      #    , "scripts/openssh-server.ps1"
    ]

    cd_label         = "cidata"
    device           = "sata3"
    iso_storage_pool = "local"
    unmount          = true
  }
  additional_iso_files {
    device   = "sata4"
    iso_file = "${var.virtio_iso_file}"
    unmount  = true
  }
  disks {
    disk_size    = "${var.vm_disk_size}"
    format       = "raw"
    storage_pool = "local-lvm"
    type         = "virtio"
    cache_mode   = "writeback"
    discard      = true
  }
  network_adapters {
    bridge   = "vmbr0"
    model    = "virtio"
    vlan_tag = "${var.vm_vlan}"
  }
}

build {
  sources = ["source.proxmox-iso.windows-10-pro-packer"]

  provisioner "windows-shell" {
    scripts = ["scripts/winupdates-disable.bat"]
  }

  provisioner "powershell" {
    scripts = [
      "scripts/custom.ps1", "scripts/hibernate-disable.ps1"
    ]
  }

  provisioner "ansible" {
    command         = "./ansible_play.sh"
    playbook_file   = "ansible/site.yml"
    user            = "autod"
    use_proxy       = false
    extra_arguments = [
      "-e", "ansible_winrm_server_cert_validation=ignore",
      "-e", "github_user=${var.github_user}"
    ]
  }

  provisioner "breakpoint" {
    disable = true ## for DEBUGGING purposes, set to false
    note    = "this is a breakpoint"
  }


}
