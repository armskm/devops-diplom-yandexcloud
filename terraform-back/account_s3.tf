# Создание сервисного аккаунта
resource "yandex_iam_service_account" "terraform" {
  folder_id = var.folder_id
  name      = var.account
}

# Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "terraform_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "terraform" {
  service_account_id = yandex_iam_service_account.terraform.id
  description        = "Static access key for Terraform S3 backend"
}

# Создание бакета
resource "yandex_storage_bucket" "tf_state" {
  bucket                = var.s3_name
  max_size              = var.s3_size
  default_storage_class = var.s3_class
    }