resource "docker_image" "drone_server" {
  name = "drone/drone:2"
}

resource "docker_container" "drone_server" {
  image = docker_image.drone_server.latest
  name = "drone-server"
  restart = "always"
  remove_volumes = false
  
  env = [
    "DRONE_GITEA_SERVER=${var.gitea_server}",
    "DRONE_GITEA_CLIENT_ID=${var.gitea_client_id}",
    "DRONE_GITEA_CLIENT_SECRET=${var.gitea_client_secret}",
    "DRONE_RPC_SECRET=${var.drone_rpc_secret}",
    "DRONE_SERVER_HOST=${var.drone_server_host}",
    "DRONE_SERVER_PROTO=${var.drone_server_protocol}",
    "DRONE_USER_CREATE=username:admin,machine:false,admin:true,token:55f24eb3d61ef6ac5e83d550178638dc"
  ]
  volumes {
    host_path = var.drone_data_mount_path
    container_path = "/data"
  }
  volumes {
    host_path = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  ports {
    internal = 80
    external = 3001
  }
  ports {
      internal = 443
      external = 3002
  }
  
}

module "drone_provider" {
  # depends_on = [ docker_container.drone_server ]
  source = "./drone-provider"
  drone_server_host=var.drone_server_host
  drone_server_protocol=var.drone_server_protocol
  reg_username=var.reg_username
  reg_pass=var.reg_pass
  ssh_private_key=var.ssh_private_key
  gitea_server=var.gitea_server
  drone_username=var.drone_username
}