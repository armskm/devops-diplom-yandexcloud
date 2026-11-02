resource "yandex_vpc_network" "k8s" {
  name = var.VPC_name
}

resource "yandex_vpc_subnet" "public" {
  count          = length(var.public_subnet_zones)
  name           = "${var.public_subnet_name}-${var.public_subnet_zones[count.index]}"
  zone           = var.public_subnet_zones[count.index]
  network_id     = yandex_vpc_network.k8s.id
  v4_cidr_blocks = ["10.1.${count.index}.0/24"]
}