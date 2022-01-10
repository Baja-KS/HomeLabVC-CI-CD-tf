variable "gitea_db_mount_path" {
  type        = string
  description = "mount path for db data"
}

variable "gitea_mount_path" {
  type        = string
  description = "mount path for gitea data"
}

variable "drone_rpc_secret" {
  type        = string
  description = "drone rpc secret string"
  sensitive   = true
}

variable "drone_server_host" {
  type        = string
  description = "hostname or ip of the drone server"
}

variable "drone_data_mount_path" {
  type        = string
  description = "mount path for gitea data"
}

variable "gitea_server" {
  type        = string
  description = "gitea url"
}

variable "gitea_client_id" {
  type        = string
  description = ""
}

variable "gitea_client_secret" {
  type        = string
  description = ""
  sensitive   = true
}

variable "drone_server_protocol" {
  type    = string
  default = "http"
}

variable "reg_username" {
  type      = string
  sensitive = true
}

variable "reg_pass" {
  type      = string
  sensitive = true
}

variable "ssh_private_key" {
  type      = string
  sensitive = true
}

variable "drone_username" {
  type = string
}