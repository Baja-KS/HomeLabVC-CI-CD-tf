

module "gitea" {
  source           = "./modules/gitea"
  db_mount_path    = var.gitea_db_mount_path
  gitea_mount_path = var.gitea_mount_path
}

module "drone_server" {
  source                = "./modules/drone-server"
  drone_data_mount_path = var.drone_data_mount_path
  drone_server_host     = var.drone_server_host
  drone_rpc_secret      = var.drone_rpc_secret
  gitea_server          = var.gitea_server
  gitea_client_id       = var.gitea_client_id
  gitea_client_secret   = var.gitea_client_secret
  reg_username          = var.reg_username
  reg_pass              = var.reg_pass
  ssh_private_key       = var.ssh_private_key
  drone_username        = var.drone_username
}

module "drone_runner_amd64" {
  source            = "./modules/drone-runner"
  drone_server_host = var.drone_server_host
  drone_rpc_secret  = var.drone_rpc_secret
}

module "drone_runner_arm32v7" {
  source            = "./modules/drone-runner"
  drone_server_host = var.drone_server_host
  drone_rpc_secret  = var.drone_rpc_secret
  runner_host       = "ssh://pi@192.168.1.198:22"
  container_name    = "drone-runner-arm"
}