

module "gitea" {
  source           = "./modules/gitea"
  db_mount_path    = var.gitea_db_mount_path
  gitea_mount_path = var.gitea_mount_path
}