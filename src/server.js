const createApp = require("./app");
const port = 3000;

createApp().listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});