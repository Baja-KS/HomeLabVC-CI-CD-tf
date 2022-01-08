terraform {
    required_providers {
      docker = {
          source="kreuzwerker/docker"
          version = "2.15.0"
      }
    }
}

provider "docker" {
  
}

resource "docker_network" "network" {
  name = "home_lab"
  driver = "bridge"
  attachable = true
}

# resource "docker_volume" "vol_db" {
#   name = "gitea-db"
#   driver = "local"
# }

# resource "docker_volume" "vol_app" {
#   name = "gitea"
#   driver = "local"
# }

resource "docker_image" "pg_db" {
  name = "postgres:13"
}

resource "docker_container" "gitea_db" {
  image = docker_image.pg_db.latest
  name = "gitea_db"
  hostname = var.db_host
  env = [
      "POSTGRES_USER=${var.db_username}",
      "POSTGRES_PASSWORD=${var.db_password}",
      "POSTGRES_DB=${var.db_name}"
  ]
  restart = "always"
  remove_volumes = false
  volumes {
    # volume_name = docker_volume.vol_db.name
    # host_path = docker_volume.vol_db.mountpoint
    host_path = var.db_mount_path
    container_path = "/var/lib/postgresql/data"
  }
  networks_advanced {
    name = docker_network.network.name
  }
}

resource "docker_image" "gitea" {
  name = "gitea/gitea:latest"
}

resource "docker_container" "gitea" {
  image = docker_image.gitea.latest
  name = "gitea"
  restart = "always"
  remove_volumes = false
  networks_advanced {
    name = docker_network.network.name
  }
  env = [
    "GITEA__database__DB_TYPE=${var.db_type}",
    "GITEA__database__HOST=${var.db_host}:5432",
    "GITEA__database__NAME=${var.db_name}",
    "GITEA__database__USER=${var.db_username}",
    "GITEA__database__PASSWD=${var.db_password}"
  ]
  volumes {
    # volume_name = docker_volume.vol_app.name
    # host_path = docker_volume.vol_app.mountpoint
    host_path = var.gitea_mount_path
    container_path = "/data"
  }
  volumes {
      read_only = true
      host_path = "/etc/timezone"
      container_path = "/etc/timezone"
  }
  volumes {
      read_only = true
    host_path = "/etc/localtime"
    container_path = "/etc/localtime"
  }
  ports {
    internal = 3000
    external = 3000
  }
  ports {
      internal = 22
      external = 222
  }
  depends_on = [
    docker_container.gitea_db
  ]
}