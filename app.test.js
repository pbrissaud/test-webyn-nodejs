const createServer = require("./app");
const supertest = require("supertest");

const server = createServer();

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