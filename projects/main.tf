# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Fetch the existing GCP Billing Account
data "google_billing_account" "eq_monitoring_billing_account" {
  display_name = var.billing_account
}

# Create the GCP Project
resource "google_project" "eq_project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = data.google_billing_account.eq_monitoring_billing_account.id
  lifecycle {
    prevent_destroy = true
  }
}
resource "google_resource_manager_lien" "lien_protection" {
  parent       = "projects/${google_project.mon_projet.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "protection-manuelle"
  reason       = "Ce projet est critique pour la production."
}

# Create a GCS bucket to store Terraform state files
resource "google_storage_bucket" "tf_state_bucket" {
  name          = "eq-monitoring-tf-state"
  location      = "EUROPE-WEST9"
  force_destroy = false
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}