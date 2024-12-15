import http from 'k6/http';
import { check, sleep } from 'k6';

// Configuration du test
export let options = {
  stages: [
    { duration: '1m', target: 10 },
    { duration: '2m', target: 20 },
    { duration: '1m', target: 0 },
  ],
};

export default function () {
  const url = `${__ENV.URL}`;
  const res = http.get(`${url}/hello`);

  // Vérifiez que le service répond correctement
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time < 200ms': (r) => r.timings.duration < 200,
  });

  sleep(1); // Pause entre les requêtes
}
