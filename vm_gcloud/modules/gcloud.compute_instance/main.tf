resource "google_compute_instance" "default" {
  name         = var.name_vm 
  machine_type = var.name_machine_type
  zone         = var.name_zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.name_image_os
      size  = var.size_image
    }
  }


  network_interface {
    network = var.name_network

    access_config {
      // Ephemeral public IP
    }
  }


  metadata_startup_script = file("../../run/compute_instance/ctfd.sh")

}

resource "google_compute_firewall" "http-server" {
    name = var.name_compute_firewall
    network = var.name_network_firewall
    allow {
      protocol = var.name_protocol
      ports = var.ports
    }

    source_ranges = var.source_ranges
    target_tags = var.target_tags
}