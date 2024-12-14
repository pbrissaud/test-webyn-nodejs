terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "6.13.0"
    }
    github = {
      source = "integrations/github"
      version = "6.4.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_credentials
}

provider "google-beta" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_credentials
}

provider "github" {
  owner = var.github_org
  token = var.github_token
}