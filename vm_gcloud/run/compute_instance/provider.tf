provider "google" {
  credentials = file("CREDENTIALS_FILE.json")
  project     = "atomic-optics-343605"
  region      = "us-west1"
}