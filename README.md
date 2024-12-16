# Hello World Node.js API

This is a simple Node.js API for demonstration purposes. It has two endpoints:

- `GET /hello` - Returns `{ "message": "Hello, World!" }`
- `GET /health` - Returns `{ "status": "ok" }`

## Requirements

- Docker
- Docker compose (>= 2.22.0)

OR

- Node.js (v20)

## Run the app locally

1. Clone the repository
```bash
git clone https://github.com/webyn-ai/hello-world-nodejs-api.git
cd hello-world-nodejs-api
```

### With Docker

2. Run this compose command
```bash
docker-compose up --build --watch
``` 

3. Access the API
- [`http://localhost:3000/hello`](http://localhost:3000/hello)
- [`http://localhost:3000/health`](http://localhost:3000/health)

Port 3000 is exposed by default. You can change the port with environment variable `PORT`.

```bash
PORT=8080 docker-compose up --build --watch
```

### With Node.js

2. Install the dependencies
```bash
npm install
```

3. Run the app in development mode (with hot reload)
```bash
npm run dev
```

4. Access the API
- [`http://localhost:3000/hello`](http://localhost:3000/hello)
- [`http://localhost:3000/health`](http://localhost:3000/health)

## Features

- Infra as Code with Terraform Cloud for shared state and remote execution
- Dockerfile for containerization with multi-stage build
- Distroless Image for minimal and secure container
- Compose file for running the app with Docker Compose and watch mode
- Testing with Jest and Supertest
- Trivy scanning for Docker image security
- Automatic CI with GitHub Actions (test and scan)
- Automatic releasing with [Release-Please](https://github.com/googleapis/release-please-action) and Conventional Commits
- CD with GitHub Actions (docker build and push and deploy to Cloud Run)
- Keyless authentication to Google Cloud with [Workload Identity Federation](https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions?hl=en)
- Automatic blue-green deployment with k6 checks

## Bootstrap the project

1. Create a GitHub repository

2. Create a Fine-grained access token with the following scopes:
  ```
  secrets: write
  variables: write
  ```

3. Create a google cloud project

4. Enable theses APIs: 
  ```
  "iam.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "iamcredentials.googleapis.com",
  "sts.googleapis.com"
  ````

5. Create a service account for Terraform Cloud with the following roles:
  ```
  "roles/iam.workloadIdentityPoolAdmin"
  "roles/iam.serviceAccountAdmin"
  "roles/resourcemanager.projectIamAdmin"
  "roles/artifactregistry.adm"
  "roles/run.admin"
  ````

6. Create a JSON key for the service account

7. Create a Terraform Cloud account and a workspace for this repository

8. Set the following variable in the workspace:
  ```
  project_id
  google_credentials (sensitive)
  github_token (sensitive)
  github_org
  github_repo
  ```

9. Push a commit on the main branch to the repository
  ````
  git commit -m "chore(main): init"
  ````

10. Open terraform cloud and apply the run

11. Merge the PR created by Release Please to create the first release

12. Watch the GitHub Actions workflow to build and deploy the app ! 🚀
