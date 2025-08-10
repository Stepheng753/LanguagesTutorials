import express from 'express';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
const port = process.env.PORT || 3001;
const fakeDB = 'fakeDB';

app.get('/', (req, res) => {
	console.log('Received GET / request');
	res.send('Hello World!');
});

app.listen(port, '0.0.0.0', () => {
	console.log(`Server listening at http://localhost:${port}`);
});
