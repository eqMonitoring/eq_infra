terraform {
  backend "gcs" {
    bucket  = "eq-monitoring-tf-state"
    prefix  = "terraform/projects"  # Organize state files in the GCS bucket
  }
}