module "create_compute_instance" {
  source                = "../../modules/gcloud.compute_instance"
  name_vm               = var.name_vm
  name_machine_type     = var.name_machine_type
  name_zone             = var.name_zone
  tags                  = var.tags
  name_image_os         = var.name_image_os
  size_image            = var.size_image
  name_network          = var.name_network
  name_compute_firewall = var.name_compute_firewall
  name_network_firewall = var.name_network_firewall
  name_protocol         = var.name_protocol
  ports                 = var.ports
  source_ranges         = var.source_ranges
  target_tags           = var.target_tags
}