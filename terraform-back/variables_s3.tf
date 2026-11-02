variable "account" {
  type    = string
  default = "sa-terraform"
}

variable "s3_size" {
  type    = number
  default = 1073741824
}

variable "s3_name" {
  type    = string
  default = "klementyev-bkt-2610"
}

variable "s3_class" {
  type    = string
  default = "STANDARD"
}