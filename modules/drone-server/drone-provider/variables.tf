variable "drone_server_host" {
    type = string
    description = "hostname or ip of the drone server"
}

variable "drone_server_protocol" {
  type = string
  default = "http"
}

variable "reg_username" {
    type=string
    sensitive=true
}

variable "reg_pass" {
    type=string
    sensitive=true
}

variable "ssh_private_key" {
    type = string
    sensitive = true
}

variable "gitea_server" {
  type=string
  description="gitea url"
}

variable "drone_username" {
  type=string
}