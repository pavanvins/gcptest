terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file(format("%s/service-account.json", env("GCP_CREDS")))
  project     = "terrafromgcp"
  }

resource "google_compute_instance" "example" {
  name         = "my-instance1"
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
