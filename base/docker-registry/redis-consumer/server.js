const express = require('express')
const redis = require("redis");

const client = redis.createClient("redis://10.106.130.41:6379")
async function start() {
await client.connect();
console.log('connected');
client.quit();
};
start();

const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
