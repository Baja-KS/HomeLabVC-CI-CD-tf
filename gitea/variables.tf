variable "db_name" {
    type = string
    description = "gitea db name"
    default = "gitea"
}
variable "db_username" {
    type = string
    description = "gitea db username"
    default = "gitea"
}
variable "db_password" {
    type = string
    description = "gitea db password"
    default = "gitea"
    sensitive = true
}
variable "db_type" {
    type = string
    description = "gitea db type(postgres,mysql...)"
    default = "postgres"
}
variable "db_host" {
    type = string
    description = "db host"
    default = "db"
}

variable "db_mount_path" {
    type = string
    description = "mount path for db data"
}

variable "gitea_mount_path" {
    type = string
    description = "mount path for gitea data"
}