data "yandex_compute_image" "ubuntu" {
  family = var.vm_os
}

#создаем мастер
resource "yandex_compute_instance" "k8s-master" {
  count = length(var.vpc_zones_master)

  name        = "${var.vm_res[0].vm_name}-${count.index + 1}"
  platform_id = var.vm_platform
  zone        = var.vpc_zones_master[count.index]

  resources {
    cores         = var.vm_res[0].cpu
    memory        = var.vm_res[0].ram
    core_fraction = var.vm_res[0].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_res[0].disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public[count.index].id
    nat                = var.vm_nat
  }
}

#создаем ноды
resource "yandex_compute_instance" "k8s-worker" {
  count = 2

  name        = "${var.vm_res[1].vm_name}-${count.index + 1}"
  platform_id = var.vm_platform
  zone        = var.public_subnet_zones[count.index + 1]

  resources {
    cores         = var.vm_res[1].cpu
    memory        = var.vm_res[1].ram
    core_fraction = var.vm_res[1].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_res[1].disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public[count.index + 1].id
    nat                = var.vm_nat
  }
}