import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  vus: 50,
  duration: '30s',
  thresholds: {
    checks: ['rate>0.95'],
  },
};

export default function () {
  const url = `${__ENV.URL}`;
  const res = http.get(`${url}/hello`);

  check(res, {
    'status is 200': (r) => r.status === 200,
  });

  sleep(1);
}
