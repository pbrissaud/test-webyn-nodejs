variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "eu-west-9"
}

variable "google_credentials" {
  type      = string
  sensitive = true
}

variable "github_org" {
  type       = string
  description = "The GitHub organization name"
  default = "pbrissaud" 
}

variable "github_repo" {
  type        = string
  description = "The GitHub repository name"
  default     = "test-webyn-nodejs"
}

variable "github_token" {
  type        = string
  description = "The GitHub token"
  sensitive   = true
}