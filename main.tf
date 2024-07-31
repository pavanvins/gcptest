terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file("C:\Users\91918\Downloads\terrafromgcp-223b10906830.json")  # Adjust path if needed
  project     = "terrafromgcp"
  region      = "us-central1"
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
