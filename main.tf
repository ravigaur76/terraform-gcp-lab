provider "google" {
  project                     = var.project_id
  region                      = var.region
  impersonate_service_account = "terraform-lab-sa@interviewprep-510016.iam.gserviceaccount.com"
}

resource "google_compute_network" "vpc" {
  name                    = "tf-demo-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "tf-demo-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}
