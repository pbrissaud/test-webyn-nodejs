
resource "google_service_account" "github_sa" {
  account_id   = "github-sa"
  display_name = "GitHub Service Account"
}

resource "google_project_iam_binding" "artifact_registry_push" {
  role    = "roles/artifactregistry.writer"
  project = var.project_id
  members = [
    "serviceAccount:${google_service_account.github_sa.email}"
  ]
}

resource "google_project_iam_binding" "cloud_run_developer" {
  role    = "roles/run.developer"
  project = var.project_id
  members = [
    "serviceAccount:${google_service_account.github_sa.email}"
  ]
}

module "gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "~> 4.0"

  project_id  = var.project_id
  pool_id     = "webyn-pool"
  provider_id = "webyn-provider"

  attribute_condition = "attribute.repository==assertion.repository"
  sa_mapping = {
    (google_service_account.github_sa.account_id) = {
      sa_name   = google_service_account.github_sa.name
      attribute = "attribute.repository/${var.github_org}/${var.github_repo}"
    }
  }
}

resource "github_actions_variable" "gh_variable_project" {
  repository    = var.github_repo
  variable_name = "PROJECT_ID"
  value         = var.project_id
}

resource "github_actions_variable" "gh_variable_region" {
  repository    = var.github_repo
  variable_name = "REGION"
  value         = var.region
}

resource "github_actions_variable" "gh_variable_artfiact_registry" {
  repository    = var.github_repo
  variable_name = "ARTIFACT_REGISTRY"
  value         = google_artifact_registry_repository.docker_registry.name
}

resource "github_actions_secret" "gh_secret_provider" {
  repository      = var.github_repo
  secret_name     = "PROVIDER_NAME"
  plaintext_value = module.gh_oidc.provider_name
}

resource "github_actions_secret" "gh_secret_sa" {
  repository      = var.github_repo
  secret_name     = "SA_EMAIL"
  plaintext_value = google_service_account.github_sa.email
}
