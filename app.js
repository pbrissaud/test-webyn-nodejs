const express = require('express');
const app = express();
const port = 3000;
const packageInfo = require('./package.json');

app.get('/hello', (_, res) => {
  res.json({ message: 'Hello, World!', version: packageInfo.version });
});

app.get('/health', (_, res) => {
  res.json({ status: 'ok' });
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});