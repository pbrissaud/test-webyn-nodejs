const express = require("express");
const app = express();
const port = 3000;
const packageInfo = require("./package.json");

function createServer() {
  app.get("/hello", (_, res) => {
    res.json({ message: "Hello World!", version: packageInfo.version });
  });

  app.get("/health", (_, res) => {
    res.json({ status: "ok" });
  });

  const server = app.listen(port, () => {
    console.log(`App running on http://localhost:${port}`);
  });

  return server;
}

createServer();

module.exports = createServer;
