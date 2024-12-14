resource "google_artifact_registry_repository" "docker_registry" {
  repository_id = "webyn-docker"
  description   = "Docker registry"
  format        = "DOCKER"
}