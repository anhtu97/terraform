variable "name_vm" {
  type        = string
  description = "Name VM (e.g. `VM01` or `Test01`)"
  default     = "Test01"
}

variable "name_machine_type" {
  type        = string
  description = "Name VM Type (e.g. `e2-small` or search `https://gcpinstances.doit-intl.com/`)"
  default     = "e2-small"
}

variable "name_zone" {
  type        = string
  description = "Name Zone (e.g. `us-central1-a` or `us-central1-c`)"
  default     = "us-central1-a"
}

variable "tags" {
  type        = list(string)
  description = "Name Tag VM (e.g. `foo` or `http-server`)"
  default     = ["http-server"]
}

variable "name_image_os" {
  type        = string
  description = "Name Tag VM (e.g. `ubuntu-os-cloud/ubuntu-2004-lts` or `ubuntu-os-cloud/ubuntu-1804-lts`)"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "size_image" {
  type        = number
  description = "Size image (e.g. `20` or `100`)"
  default     = 20
}

variable "name_network" {
  type        = string
  description = "Name Network (e.g. `default` or `default1`)"
  default     = "default"
}

variable "name_compute_firewall" {
  type        = string
  description = "Name Rule Firewall (e.g. `default-allow-http-terraform` or `default1`)"
  default     = "default-allow-http-terraform"
}

variable "name_network_firewall" {
  type        = string
  description = "Name Network -> name_network (e.g. `default` or `default1`)"
  default     = "default"
}

variable "name_protocol" {
  type        = string
  description = "Name Protocol (e.g. `tcp` or `udp`)"
  default     = "tcp"
}

variable "ports" {
  type        = list(string)
  description = "List port open "
  default     = ["80", "443"]
}

variable "source_ranges" {
  type        = list(string)
  description = "List source ranges"
  default     = ["0.0.0.0/0"]
}

variable "target_tags" {
  type        = list(string)
  description = "list of target tags that need to add firewall rule -> tags (e.g. `foo` or `http-server`)"
  default     = ["http-server"]
}