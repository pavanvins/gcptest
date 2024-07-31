terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = data.google_compute_ssh_rsa_key.my_key.private_key
  project     = "terrafromgcp"
  region      = "us-central1"
}

data "google_compute_ssh_rsa_key" "my_key" {
  private_key = templatefile("${WORKSPACE}/service-account.json", {
    KEY = credentials.gcp-keyterrafromgcp-223b10906830.json.secret  # Replace with your actual credential ID
  })
}

resource "google_compute_instance" "example" {
  name         = "my-instance"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
