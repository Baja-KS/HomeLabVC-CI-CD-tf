terraform {
    required_providers {

      drone = {
          source = "Lucretius/drone"
          version = "0.2.5"
      }

    }
}

provider "drone" {
  server = "${var.drone_server_protocol}://${var.drone_server_host}/"
  token = "55f24eb3d61ef6ac5e83d550178638dc"
}