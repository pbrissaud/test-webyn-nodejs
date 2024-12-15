resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-sa"
  display_name = "Cloud Run Service Account"
}

resource "google_project_iam_member" "cloud_run_artifact_registry_access" {
  member  = "serviceAccount:${google_service_account.cloud_run_sa.email}"
  role    = "roles/artifactregistry.reader"
  project = var.project_id
}


resource "google_cloud_run_v2_service" "webyn_service" {
  name                = var.github_repo
  project             = var.project_id
  location            = var.region
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"
  template {
    service_account = google_service_account.cloud_run_sa.email

    scaling {
      min_instance_count = 1
      max_instance_count = 50
    }
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_registry.name}/${var.github_repo}:latest"
      ports {
        container_port = 3000
      }

      resources {
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
      }

      startup_probe {
        initial_delay_seconds = 5
        timeout_seconds = 1
        period_seconds = 10
        failure_threshold = 1
        http_get {
          path = "/health"
        }
      }

      liveness_probe {
        http_get {
          path = "/health"
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
    tag = "blue"
  }
}

resource "google_cloud_run_service_iam_binding" "webyn_service" {
  location = google_cloud_run_v2_service.webyn_service.location
  service  = google_cloud_run_v2_service.webyn_service.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}