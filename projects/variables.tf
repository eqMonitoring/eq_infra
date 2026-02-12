variable project_name{
    description="Name of the project"
    type=string
}

variable project_id{
    description="Identifier of the project"
    type=string
}

variable billing_account_id{
    description="Billing account identifier of the project"
    type=string
}

variable "region"{
    description="Region of our resources to deploy"
    type=string
    default="europe-west9"
}

variable "zone"{
    description="Zone of our resources to deploy"
    type=string
    default="europe-west9-a"
}

variable "gcp_apis_to_enable" {
  description = "List of GCP APIs to enable for the project."
  type        = list(string)
  default = [
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com",
    "run.googleapis.com",
    "bigquery.googleapis.com",
    "compute.googleapis.com",
  ]
}