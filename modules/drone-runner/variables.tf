variable "drone_rpc_secret" {
    type = string
    description = "drone rpc secret string"
    sensitive=true
}

variable "drone_server_host" {
    type = string
    description = "hostname or ip of the drone server"
}
variable "drone_server_protocol" {
  type = string
  default = "http"
}
variable "host_port" {
  type=number
  default=3003
}
variable "capacity" {
    type=number
    default=1
}

variable "runner_host" {
  type=string
  default = "unix:///var/run/docker.sock"
}

variable "container_name" {
    type=string
    default = "drone-runner"
}