
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

module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.project_id
  pool_id     = "webyn-pool"
  provider_id = "webyn-provider"
  sa_mapping = {
    "github-service-account" = {
      sa_name   = "projects/${var.project_id}/serviceAccounts/${google_service_account.github_sa.email}"
      attribute = "attribute.repository/${var.github_org}/${var.github_repo}"
    }
  }
}

resource "github_actions_secret" "gh_secret_provider" {
  repository       = var.github_repo
  secret_name      = "PROVIDER_NAME"
  plaintext_value  = module.gh_oidc.provider_name
}

resource "github_actions_secret" "gh_secret_sa" {
  repository       = var.github_repo
  secret_name      = "SA_EMAIL"
  plaintext_value  = google_service_account.github_sa.email
}
