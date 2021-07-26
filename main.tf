terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("my_gcp.json")

  project = "project_vasis"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "moodle"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210720"
    }
  }

  metadata = {
    ssh-keys = "vasis:${file("google-cloud.pub")}"
  }

  metadata_startup_script = "sudo apt update; sudo apt install apache2 -y"

  tags = ["http-server", "https-server"]

  network_interface {
    network = "default"
    access_config {
    }
  }
}
