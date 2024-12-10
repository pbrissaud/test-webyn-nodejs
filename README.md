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

- Dockerfile for containerization with multi-stage build
- Distroless Image for minimal and secure container
- Compose file for running the app with Docker Compose and watch mode
