resource "docker_image" "drone_runner" {
  name = "drone/drone-runner-docker:1.8"
}

resource "docker_container" "drone_runner" {
  image = docker_image.drone_runner.latest
  name = var.container_name
  restart = "always"
  
  env = [
    "DRONE_RPC_SECRET=${var.drone_rpc_secret}",
    "DRONE_RPC_HOST=${var.drone_server_host}",
    "DRONE_RPC_PROTO=${var.drone_server_protocol}",
    "DRONE_RUNNER_NAME=${var.container_name}",
    "DRONE_RUNNER_CAPACITY=${var.capacity}"
  ]
  volumes {
    host_path = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  ports {
    internal = 3000
    external = var.host_port
  }
  
}