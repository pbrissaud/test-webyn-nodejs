const createApp = require("./app");
const supertest = require("supertest");

const app = createApp();

let server;

beforeAll(() => {
  const randomPort = Math.floor(Math.random() * 1000) + 3000;
  server = app.listen(randomPort);
})  

afterAll(done => {
	server.close(done)
	done()
})

test("GET /hello", async () => {

  await supertest(server)
    .get("/hello")
    .expect(200)
    .then((response) => {
      expect(response.body.message).toBe("Hello World!");
			expect(response.body.version).toBeTruthy();
    });
});