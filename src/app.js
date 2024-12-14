const express = require("express");
const app = express();
const packageInfo = require("../package.json");

function createApp() {
  app.get("/hello", (_, res) => {
    res.json({ message: "Hello World!", version: packageInfo.version });
  });

  app.get("/health", (_, res) => {
    res.json({ status: "ok" });
  });

  return app;
}

module.exports = createApp;
