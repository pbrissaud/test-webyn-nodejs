# Terraform Infrastructure Documentation

This Terraform configuration sets up a Google Cloud Platform (GCP) infrastructure for deploying a containerized application using Cloud Run with GitHub Actions integration.

## Prerequisites

- Terraform Cloud account
- Google Cloud Platform project
- GitHub repository
- Required permissions and API enablement in GCP

## Providers

- `google` (v6.13.0)
- `google-beta` (v6.13.0)
- `github` (v6.4.0)

## Resources

### Container Registry
- `google_artifact_registry_repository`: Docker registry for storing container images

### Cloud Run Service
- `google_cloud_run_v2_service`: Managed serverless platform for container deployment
  - Autoscaling configuration (1-50 instances)
  - Health checks and probes
  - Public access enabled

### Service Accounts
1. **Cloud Run Service Account**
   - Used by Cloud Run service
   - Has permissions:
     - Artifact Registry Reader
     - Service Account User

2. **GitHub Service Account**
   - Used by GitHub Actions
   - Has permissions:
     - Artifact Registry Writer
     - Cloud Run Admin
     - Service Account User

### GitHub Integration
- Workload Identity Federation setup for keyless authentication
- GitHub Actions variables and secrets configuration
- Repository-level configuration for CI/CD

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_id | GCP project ID | string | required |
| region | GCP region | string | europe-west9 |
| google_credentials | GCP service account credentials | string | required |
| github_org | GitHub organization name | string | pbrissaud |
| github_repo | GitHub repository name | string | test-webyn-nodejs |
| github_token | GitHub personal access token | string | required |

## Backend Configuration

Uses Terraform Cloud as the backend with:
- Organization: "Webyn"
- Workspace: "test-webyn-nodejs"