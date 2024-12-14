ARG NODE_VERSION=20

##############
# BASE STAGE
##############
FROM node:${NODE_VERSION} AS base
WORKDIR /app
COPY package*.json ./

##############
# DEVELOPMENT STAGE
##############
FROM base AS development
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]

##############
# BUILD STAGE
##############
FROM base AS build
RUN npm ci --omit=dev 
COPY src src

##############
# PROD STAGE
##############
FROM gcr.io/distroless/nodejs${NODE_VERSION}-debian12:nonroot
COPY --from=build --chown=nonroot:nonroot /app /app
WORKDIR /app
EXPOSE 3000
CMD ["src/server.js"]