# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Activate the necessary GCP APIs using for_each
resource "google_project_service" "enabled_apis" {
  for_each = toset(var.gcp_apis_to_enable)
  project = var.project_id
  service = each.value
  disable_on_destroy = false
  # Ensure serviceusage is enabled before other APIs
  depends_on = [
    google_project_service.enabled_apis["serviceusage.googleapis.com"]
  ]
}
