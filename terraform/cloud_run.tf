resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-sa"
  display_name = "Cloud Run Service Account"
}

resource "google_project_iam_member" "cloud_run_artifact_registry_access" {
  member = "serviceAccount:${google_service_account.cloud_run_sa.email}"
  role   = "roles/artifactregistry.reader"
  project = var.project_id
}


resource "google_cloud_run_v2_service" "webyn_service" {
  name                = var.github_repo
  project             = var.project_id
  location            = var.region
  deletion_protection = true
  ingress             = "INGRESS_TRAFFIC_ALL"
  template {
    service_account = google_service_account.cloud_run_sa.email

    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_registry.name}/${var.github_repo}:latest"
      resources {
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}