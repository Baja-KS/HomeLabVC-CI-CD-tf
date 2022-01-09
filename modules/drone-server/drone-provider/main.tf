resource "drone_user" "bajaks" {
  admin = true
  login = var.drone_username
  active = true
}

resource "drone_orgsecret" "dockerhub_username" {
  namespace  = var.drone_username
  name       = "dockerhub_username"
  value      = var.reg_username
}

resource "drone_orgsecret" "dockerhub_pass" {
  namespace  = var.drone_username
  name       = "dockerhub_pass"
  value      = var.reg_pass
}

resource "drone_orgsecret" "SSH_HOST" {
  namespace  = var.drone_username
  name       = "SSH_HOST"
  value      = split(":",var.gitea_server)[0]
}

resource "drone_orgsecret" "SSH_PORT" {
  namespace  = var.drone_username
  name       = "SSH_PORT"
  value      = split(":",var.gitea_server)[1]
}

resource "drone_orgsecret" "SSH_KEY" {
  namespace  = var.drone_username
  name       = "SSH_KEY"
  value      = var.ssh_private_key
}