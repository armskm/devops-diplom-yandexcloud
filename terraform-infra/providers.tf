terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.12.0"

  backend "s3" {
    endpoints                    = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket                      = "klementyev-bkt-2610"
    key                         = "infra/terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }


}

provider "yandex" {
  token      = var.token
  cloud_id   = var.cloud_id
  folder_id  = var.folder_id
  zone       = var.default_zone
}